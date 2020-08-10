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
    
    @Published var counter: Int
    @Published var isEnd: Bool = false
    
    init(countNum: Int){
        self.counter = countNum
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
            // 0以下になるまでカウントダウンする
            if self.counter > 0 {
                self.counter -= 1
            // 0以下になったら、coutner変数を0にする
            } else {
                self.isEnd = true
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
    func reset() {
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったら中断
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
        }
        counter = 3
    }

}
