//
//  TimerView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/06.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

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



struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
