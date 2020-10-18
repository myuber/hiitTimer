//
//  Timer.swift
//  HiitTimer
//
//  Created by がり on 2020/08/07.
//  Copyright © 2020 がり. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

// タイマークラスを定義
class CountDownTimer: ObservableObject {
    // タイマーの数値を変数に格納してカウントダウンする
    @Published var counter: Int
    @Published var interval: Int
    @Published var numOfTimes: Int
    
    // アラートを出現させるために、タイマーの終了を格納する変数
    @Published var isEnd: Bool = false
    
    // counter/intervalの判定用変数
    @Published var isCounter: Bool = true
    
    
    // ブザー用のプレイヤーインスタンスを作成
    var soundPlayer: AVAudioPlayer?
    var EndSoundPlayer: AVAudioPlayer?
    
    
    func soundPlay() {
        // ブザーの音源の場所を指定
        if let path = Bundle.main.path(forResource: "alerm", ofType: "mp3") {
            //プロジェクト内にあるパスを参照
            do {
                soundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                // 音源再生
                soundPlayer?.play()
            } catch let error {
                print("\(error)が発生しました")
            }
        }
    }
    
    func EndSoundPlay() {
        // ブザーの音源の場所を指定
        if let path = Bundle.main.path(forResource: "decision", ofType: "mp3") {
            //プロジェクト内にあるパスを参照
            do {
                EndSoundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                // 音源再生
                EndSoundPlayer?.play()
            } catch let error {
                print("\(error)が発生しました")
            }
        }
    }
    
    
    init(_ countNum: Int, _ intervalNum: Int, _ timesNum: Int){
        self.counter = countNum
        self.interval = intervalNum
        self.numOfTimes = timesNum
    }
    
    // 設定値のコピーを定義
    @Published var counterCopy = 0
    @Published var intervalCopy = 0
    @Published var numOfTimesCopy = 0
    
    // タイマーを作成
    var timer : Timer?
    
    
    // 実際に使うタイマーを作ってスタート
    func start() {
        // 画面スリープを停止
        if UIApplication.shared.isIdleTimerDisabled == false {
            UIApplication.shared.isIdleTimerDisabled = true
        }
        
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったらなにもしない
            if nowTimer.isValid == true {
                // 何もしない
                return
            }
        }
        
        // Copyを作成してタイマーを起動する
        // 停止中にスタートを押すとタイマーが最初の値に戻ってしまうため、初期値のとき以外はsetCopyしない
        // セット回数だけはタイマーが無限ループしてしまうので、setCopyとは別で呼び出す
        if counterCopy == 0, intervalCopy == 0, numOfTimesCopy == 0 {
            self.soundPlay()
            setCopy()
            self.numOfTimesCopy = self.numOfTimes
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
            // counterが0になるまでカウントダウンする
            if (4 < self.counterCopy) {
                self.counterCopy -= 1
            } else if (0 < self.counterCopy && self.counterCopy <= 4) {
                self.soundPlay()
                self.counterCopy -= 1
            } else {
                if self.isCounter {
                    self.isCounter = false
                }
               // intervalが0になるまでカウントダウンする
                if (4 < self.intervalCopy) {
                    self.intervalCopy -= 1
                } else if (0 < self.intervalCopy && self.intervalCopy <= 4) {
                    self.soundPlay()
                    self.intervalCopy -= 1
                }else{
                    
                    self.numOfTimesCopy -= 1
                    
                    if self.numOfTimesCopy <= 0 {
                        // どちらも0なら終了
                        self.isEnd = true
                        self.EndSoundPlay()
                        self.stop()
                        // 画面スリープを再開
                        if UIApplication.shared.isIdleTimerDisabled == true {
                            UIApplication.shared.isIdleTimerDisabled = false
                        }
                    } else {
                        self.setCopy()
                        self.isCounter = true
                    }
                }
            }
        }
    }

    // タイマーを止める
    func stop() {
        // 画面スリープを再開
        if UIApplication.shared.isIdleTimerDisabled == true {
            UIApplication.shared.isIdleTimerDisabled = false
        }
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったら一時停止
            if nowTimer.isValid == true {
                nowTimer.invalidate()
                if !self.isCounter {
                    self.isCounter = true
                }
            }
        }
    }
    
    
    // タイマーをリセット
    func reset(_ countNum: Int, _ intervalNum: Int, _ timesNum: Int) {
        // 画面スリープを再開
        if UIApplication.shared.isIdleTimerDisabled == true {
            UIApplication.shared.isIdleTimerDisabled = false
        }
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったら中断
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
        }
        self.counter = countNum
        self.interval = intervalNum
        self.numOfTimes = timesNum
        self.setCopy()
    }
    
    // タイマーの値をセットする
    func setValue(_ countNum: Int, _ intervalNum: Int, _ timesNum: Int) {
        // 画面スリープを再開
        if UIApplication.shared.isIdleTimerDisabled == true {
            UIApplication.shared.isIdleTimerDisabled = false
        }
        self.counter = countNum
        self.interval = intervalNum
        self.numOfTimes = timesNum
        
        self.setCopy()
        self.numOfTimesCopy = self.numOfTimes
    }
    
    func setCopy(){
        self.counterCopy = self.counter
        self.intervalCopy = self.interval
    }

}
