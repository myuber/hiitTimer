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
    @EnvironmentObject var countdowntimer: CountDownTimer
    
    var body: some View {
        VStack{
            Text(countdowntimer.isTimer ? "Training" : "Interval")
            
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
    static var previews: some View {
        TimerController()
            .environmentObject(ShareData())
    }
}
