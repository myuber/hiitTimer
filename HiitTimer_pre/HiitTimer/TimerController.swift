//
//  TimerController.swift
//  HiitTimer
//
//  Created by がり on 2020/08/20.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct TimerController: View {
    // 共有のデータを保持する
    @EnvironmentObject var shareData: ShareData
    @ObservedObject var countdowntimer: CountDownTimer
    
    var body: some View {
        VStack{            
            Text("\(self.countdowntimer.counter)")
            Text(self.countdowntimer.isEnd ? "true" : "false")
            
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
                    self.countdowntimer.reset(
                        Int(self.shareData.TIMES[Int(self.shareData.selectTime)]),
                        Int(self.shareData.INTERVALS[Int(self.shareData.selectInterval)]),
                        Int(self.shareData.NUMBEROFTIMES[Int(self.shareData.selectNumOfTimes)])
                    )
                }) {Image(systemName: "backward.end")}.padding()
            }
        }
    }
}


struct TimerController_Previews: PreviewProvider {
    static var cdt = CountDownTimer(5, 10, 8)
    
    static var previews: some View {
        
        TimerController(countdowntimer: cdt)
            .environmentObject(ShareData())
    }
}
