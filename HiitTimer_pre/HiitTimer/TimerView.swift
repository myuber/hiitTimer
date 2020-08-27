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

    fileprivate func TimerReset() {
        self.countdowntimer.reset(
            Int(self.shareData.TIMES[Int(self.shareData.selectTime)]),
            Int(self.shareData.INTERVALS[Int(self.shareData.selectInterval)]),
            Int(self.shareData.NUMBEROFTIMES[Int(self.shareData.selectNumOfTimes)])
        )
        self.countdowntimer.numOfTimesCopy = self.countdowntimer.numOfTimes
    }
    
    var body: some View {
        NavigationView{
            VStack {
                // 数字をタップするとモーダルビューが表示される
                Text("時間を変更する場合はクリック")
                    .foregroundColor(Color(.systemTeal))
                NavigationLink(destination: SettingView()){
                    SettingCheckView(countdowntimer: self.countdowntimer)
                }
                // タイマーを表示
                ZStack {
                    
                    VStack {
                        Text("\(self.countdowntimer.isCounter ? self.countdowntimer.counterCopy : self.countdowntimer.intervalCopy)")
                        .font(.largeTitle)
                            .padding(.bottom, 10)
                        
                        HStack(alignment: .bottom){
                            Text("残りセット：")
                                .font(.headline)
                                .foregroundColor(Color.white)
                            Text("\(self.countdowntimer.numOfTimesCopy)")
                                .font(.title)
                                .padding(.bottom, -3.0)
                            .foregroundColor(Color.white)
                                
                            Text("/ \(self.countdowntimer.numOfTimes)")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        }
                        .padding([.top, .bottom], 10)
                        .padding([.leading, .trailing], 20.0)
                        .background(Color(.systemOrange))
                    }
                    
                    // 残り時間を表示するサークルビューを描画
                    TimerCircle(countdowntimer: self.countdowntimer)
                    
                } // ZStack
                
                // タイマーを操作するコントローラービューを描画
                TimerController(countdowntimer: self.countdowntimer)
                
                Spacer()
                
            } //VStack
                
            // タイマーが0になったら、アラートを表示する
            // アラートのOKボタンを押すと、countdowntimerのresetメソッドを実行
            .alert(isPresented: $countdowntimer.isEnd, content: {
                Alert(title: Text("タイマー終了"), message: Text("お疲れ様でした"), dismissButton: .default(Text("OK"), action: {
                    self.TimerReset()
                    })
                ) // Alert
            }) // alert
            .onAppear{self.TimerReset()}
        } // NavigationView
    } // body
} // struct



struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(ShareData())
    }
}
