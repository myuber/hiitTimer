//
//  Timer.swift
//  HiitTimer
//
//  Created by がり on 2020/08/07.
//  Copyright © 2020 がり. All rights reserved.
//

import Foundation

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
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったらなにもしない
            if nowTimer.isValid == true {
                // 何もしない
                return
            }
        }
        
        // Copyを作成してタイマーを起動する
        // セット回数だけはタイマーが無限ループしてしまうので、setCopyとは別で呼び出す
        setCopy()
        self.numOfTimesCopy = self.numOfTimes
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
            // counterが0になるまでカウントダウンする
            if self.counterCopy > 0 {
                self.counterCopy -= 1
            } else {
                if self.isCounter {
                    self.isCounter = false
                }
               // intervalが0になるまでカウントダウンする
                if self.intervalCopy > 0 {
                    self.intervalCopy -= 1
                }else{
                    
                    self.numOfTimesCopy -= 1
                    
                    if self.numOfTimesCopy <= 0 {
                        // どちらも0なら終了
                        self.isEnd = true
                        self.stop()
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
