//
//  TimerCircle.swift
//  HiitTimer
//
//  Created by がり on 2020/08/21.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct TimerCircle: View {
    // 共有のデータを保持する
    @EnvironmentObject var shareData: ShareData
    @ObservedObject var countdowntimer: CountDownTimer
    
    var body: some View {
        ZStack {
            // 背景のグレーの円を描画
            Circle()
                .stroke(Color(.systemGray), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .bevel))
                .aspectRatio(contentMode: .fit)
                .padding()
            /*
            // インターバルのプログレスバーを描画
             Circle()
            .trim(from: 0, to: CGFloat(self.countdowntimer.intervalCopy)/CGFloat(self.shareData.INTERVALS[self.shareData.selectInterval])
            ).stroke(Color(.systemTeal), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .bevel))
            .aspectRatio(contentMode: .fit)
            .rotationEffect(Angle(degrees: -90))
                .animation(.linear(duration: 1)) //アニメーションを追加
            .padding()
            
            // トレーニングのプログレスバーを描画
             Circle()
            .trim(from: 0, to: CGFloat(self.countdowntimer.counterCopy)/CGFloat(self.shareData.TIMES[self.shareData.selectTime])
            ).stroke(Color(.systemPink), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .bevel))
            .aspectRatio(contentMode: .fit)
            .rotationEffect(Angle(degrees: -90))
                .animation(.linear(duration: 1)) //アニメーションを追加
            .padding()
            */
            
            // 水色のプログレスバーを描画
             Circle()
            .trim(from: 0, to:
                self.countdowntimer.isCounter ? CGFloat(self.countdowntimer.counterCopy)/CGFloat(self.shareData.TIMES[self.shareData.selectTime]) : CGFloat(self.countdowntimer.intervalCopy)/CGFloat(self.shareData.INTERVALS[self.shareData.selectInterval])
             ).stroke(self.countdowntimer.isCounter ? Color(.systemPink) : Color(.systemTeal),
                     style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .bevel))
            .aspectRatio(contentMode: .fit)
            .rotationEffect(Angle(degrees: -90))
                .animation(.linear(duration: 1)) //アニメーションを追加
            .padding()
        }
    }
}

/*
// 水色のプログレスバーを描画
 Circle()
.trim(from: 0, to:
    self.countdowntimer.isCounter ? CGFloat(self.countdowntimer.counter)/CGFloat(self.shareData.TIMES[self.shareData.selectTime]) : CGFloat(self.countdowntimer.interval)/CGFloat(self.shareData.INTERVALS[self.shareData.selectInterval])
).stroke(Color(.systemTeal), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .bevel))
.aspectRatio(contentMode: .fit)
.rotationEffect(Angle(degrees: -90))
*/

struct TimerCircle_Previews: PreviewProvider {
    static var cdt = CountDownTimer(20, 10, 8)
    
    static var previews: some View {
        TimerCircle(countdowntimer: cdt)
            .environmentObject(ShareData())
    }
}
