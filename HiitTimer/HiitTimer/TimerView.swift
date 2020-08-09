//
//  TimerView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/06.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    // CountDownTimerのインスタンスを作成
    @ObservedObject var countdowntimer = CountDownTimer()
    
    var body: some View {
        VStack {
            // タイマーを表示
            Text("\(self.countdowntimer.counter)")
        
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
            }.frame(width: 200)
        
        }.font(.largeTitle)
        // タイマーが0になったら、アラートを表示する
        // アラートのOKボタンを押すと、countdowntimerのresetメソッドを実行
        .alert(isPresented: $countdowntimer.isEnd, content: {
            Alert(title: Text("タイマー終了"), message: Text("お疲れ様でした"), dismissButton: .default(Text("OK"), action: {self.countdowntimer.reset()}))
        })
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
