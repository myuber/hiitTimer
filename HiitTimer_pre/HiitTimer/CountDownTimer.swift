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
            // 0になるまでカウントダウンする
            self.counter -= 1
            
            if self.counter <= 0 {
                self.isEnd = true
                self.stop()
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
