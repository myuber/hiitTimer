//
//  TimerView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/19.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    var isTimer: Bool = true
    @State var isModal = false
    @ObservedObject var timeCounter: TimerEntity
    
    var body: some View {
        VStack {
            Text("\(self.timeCounter.training)")
            /*Text(isTimer ? "Training" : "Interval")
            
            // タイマーを表示
            ZStack {
                // 数字をタップするとモーダルビューが表示される
                VStack {
                    Button(action: {
                        self.isModal = true
                    }) {
                        Text("\(self.countdowntimer.counter)")
                    }
                    Button(action: {
                        self.isModal = true
                    }) {
                        Text("\(self.intervaltimer.counter)")
                    }
                } // シートで数値を変えるごとに共有データShareDataのTIMES配列から数値を持ってきて、タイマーの数値を変更する
            .sheet(isPresented: $isModal,
                   onDismiss:{}
                ){SettingView().environmentObject(self.shareData)} // モーダルビューに共有データを教える

            // 背景のグレーの円を描画
            Circle()
                .stroke(Color(.systemGray), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .bevel))
                .aspectRatio(contentMode: .fit)
                .padding()
            // 水色のプログレスバーを描画
            Circle()
                .trim(from: 0, to: isTimer ?
                    (CGFloat(self.countdowntimer.counter)/CGFloat(self.shareData.TIMES[self.shareData.selectTime])) :
                    (CGFloat(self.intervaltimer.counter)/CGFloat(self.shareData.INTERVALS[self.shareData.selectInterval]))
                ).stroke(Color(.systemTeal), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .bevel))
                .aspectRatio(contentMode: .fit)
                .rotationEffect(Angle(degrees: -90))
                .padding()
        }
        */
            HStack {
                // スタートボタン
                Button(action: {}) {
                    Image(systemName: "play")
                }.padding()
                
                // 一時停止ボタン
                Button(action: {}) {
                    Image(systemName: "pause")
                }.padding()
                
                // 中断ボタン
                Button(action: {}) {Image(systemName: "backward.end")}.padding()
            }.frame(width: 200)
        }
    } // body
} // struct

    
    
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer.viewContext
        
        let newTimer = TimerEntity(context: context)
        newTimer.training = 1
        newTimer.interval = 0
        newTimer.numOfTimes = 8
        newTimer.isEnd = false
        
        return TimerView(timeCounter: newTimer)
    }
}
