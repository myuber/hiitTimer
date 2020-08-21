//
//  TimerView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/06.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    // 共有のデータを保持する
    @EnvironmentObject var shareData: ShareData
        
    // CountDownTimerのインスタンスを作成
    @ObservedObject var countdowntimer = CountDownTimer(20, 10, 8)
    
    // モーダルビューを表示するための変数を定義
    @State var isModal: Bool = false

    var body: some View {
        VStack {
            // タイマーを表示
            ZStack {
                // 数字をタップするとモーダルビューが表示される
                VStack {
                    Button(action: {
                        self.isModal = true
                    }) {
                        VStack {
                            Text("\(self.countdowntimer.counter)")
                                .font(.largeTitle)
                                .padding()
                            Text("\(self.countdowntimer.counter)")
                                .font(.largeTitle)
                        }
                    }
                }
                TimerCircle(countdowntimer: self.countdowntimer)
                
            }
            TimerController(countdowntimer: self.countdowntimer)
        } //VStack
        // タイマーが0になったら、アラートを表示する
        // アラートのOKボタンを押すと、countdowntimerのresetメソッドを実行
            .alert(isPresented: $countdowntimer.isEnd, content: {
                Alert(title: Text("タイマー終了"), message: Text("お疲れ様でした"), dismissButton: .default(Text("OK"), action: {
                        self.countdowntimer.reset(
                            Int(self.shareData.TIMES[Int(self.shareData.selectTime)]),
                            Int(self.shareData.INTERVALS[Int(self.shareData.selectInterval)]),
                            Int(self.shareData.NUMBEROFTIMES[Int(self.shareData.selectNumOfTimes)])
                        )
                    })
            ) // Alert
        }) // alert
        
    } // body
} // struct



struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(ShareData())
    }
}
