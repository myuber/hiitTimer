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
    
    // モーダルビューを表示するための変数を定義
    @State var isModal: Bool = false
    
    var body: some View {
        VStack {
            // タイマーを表示
            // 数字をタップするとモーダルビューが表示される
            Button(action: {
                self.isModal = true
            }) {
                Text("\(self.countdowntimer.counter)")
            }// シートで数値を変えるごとに共有データShareDataのTIMES配列から数値を持ってきて、タイマーの数値を変更する
            .sheet(isPresented: $isModal, onDismiss:{self.countdowntimer.setValue(self.shareData.TIMES[self.shareData.selectTime])}) {
                // モーダルビューに共有データを教える
                SettingView().environmentObject(self.shareData)
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
