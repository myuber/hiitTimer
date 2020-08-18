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
    
    // タイマーのコピーを作成
    var counterCopy: Int = 0
    var intervalCopy: Int = 0
    
    // タイマーをtrainig/intervalを判定するための変数を定義
    @Published var isTimer: Bool = true
    
    init(_ countNum: Int, _ intervalNum: Int, _ timesNum: Int){
        self.counter = countNum
        self.interval = intervalNum
        self.numOfTimes = timesNum
    }
    
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
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
            while self.numOfTimes > 0 {
                self.counterCopy = self.counter
                self.intervalCopy = self.interval
                // 0になるまでカウントダウンする
                while self.counterCopy > 0 {
                    self.counterCopy -= 1
                }
                self.isTimer = false
                // 0になるまでインターバルを数える
                while self.intervalCopy > 0 {
                    self.intervalCopy -= 1
                }
                self.numOfTimes -= 1
                if self.numOfTimes <= 0{
                    self.isEnd = true
                    break
                }
                self.isTimer = true
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
    }
    
    // タイマーの値をセットする
    func setValue(_ countNum: Int, _ intervalNum: Int, _ timesNum: Int) {
        self.counter = countNum
        self.interval = intervalNum
        self.numOfTimes = timesNum
    }

}
