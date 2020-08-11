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
    @ObservedObject var countdowntimer = CountDownTimer(20)
    @ObservedObject var intervaltimer = CountDownTimer(20)
    
    // モーダルビューを表示するための変数を定義
    @State var isModal: Bool = false

    // タイマーをtrainig/intervalを判定するための変数を定義
    @State var isTimer: Bool = true
    
    var body: some View {
        VStack {
            Text(isTimer ? "Training" : "Interval")
            
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
                }// シートで数値を変えるごとに共有データShareDataのTIMES配列から数値を持ってきて、タイマーの数値を変更する
                    .sheet(isPresented: $isModal,
                           onDismiss:{self.countdowntimer.setValue(self.shareData.TIMES[self.shareData.selectTime]);
                            self.intervaltimer.setValue(self.shareData.INTERVALS[self.shareData.selectInterval])
                    }) {
                    // モーダルビューに共有データを教える
                    SettingView().environmentObject(self.shareData)
                }

                // 背景のグレーの円を描画
                Circle()
                    .stroke(Color(.systemGray), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .bevel))
                    .aspectRatio(contentMode: .fit)
                    .padding()
                // 水色のプログレスバーを描画
                Circle().trim(from: 0, to:
                    CGFloat(self.countdowntimer.counter)/CGFloat(self.shareData.TIMES[self.shareData.selectTime]))
                    .stroke(Color(.systemTeal), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .bevel))
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle(degrees: -90))
                    .padding()
            }
            
            
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
                    self.countdowntimer.reset(self.shareData.TIMES[self.shareData.selectTime])
                }) {
                    Image(systemName: "backward.end")
                }.padding()
            }.frame(width: 200)
        
        }.font(.largeTitle)
        // タイマーが0になったら、アラートを表示する
        // アラートのOKボタンを押すと、countdowntimerのresetメソッドを実行
        .alert(isPresented: $countdowntimer.isEnd, content: {
            Alert(title: Text("タイマー終了"), message: Text("お疲れ様でした"), dismissButton: .default(Text("OK"), action: {self.countdowntimer.reset(self.shareData.TIMES[self.shareData.selectTime])}))
        })
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
        .environmentObject(ShareData())
    }
}
