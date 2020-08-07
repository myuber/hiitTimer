//
//  TimerView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/06.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI
import Foundation

struct TimerView: View {
    @ObservedObject var countdowntimer = CountDownTimer()
    
    var body: some View {
        VStack {
            HStack {
                // スタートボタン
                Button(action: {
                    self.countdowntimer.start()
                }) {
                    Image(systemName: "play")
                }.padding()
                
                // 一時停止ボタン
                Button(action: {
                    self.countdowntimer.stop()
                }) {
                    Image(systemName: "pause")
                }.padding()
                
                // 中断ボタン
                Button(action: {
                    self.countdowntimer.reset()
                }) {
                    Image(systemName: "backward.end")
                }.padding()
            }
            .frame(width: 200)
            // タイマーを表示
            Text("\(self.countdowntimer.counter)")
        }.font(.largeTitle)
    }
}

// タイマークラスを定義
class CountDownTimer: ObservableObject {
    // 共有できる変数
    @Published var counter: Int = 0
    // タイマーを作成
    var timer = Timer()
    
    // 実際に使うタイマーを作ってスタート
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
            self.counter += 1
        }
    }
    
    // タイマーを止める
    func stop() {
        timer.invalidate()
    }
    
    // タイマーをリセット
    func reset() {
        timer.invalidate()
        counter = 0
    }
}



struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
