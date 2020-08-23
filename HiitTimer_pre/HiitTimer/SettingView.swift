//
//  SettingView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/09.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    // 共有できるデータを保持
    @EnvironmentObject var shareData: ShareData
    
        
    var body: some View {
        Form {
            Section(header: Text("運動時間を変更する")){
                Picker(selection: $shareData.selectTime, label: Text("運動")) {
                    ForEach(0..<self.shareData.TIMES.count) { index in
                        Text("\(self.shareData.TIMES[index])秒").tag(index)
                    }
                }
            }
            Section(header: Text("インターバルを変更する")){
                Picker(selection: $shareData.selectInterval, label: Text("休憩")) {
                    ForEach(0..<self.shareData.INTERVALS.count) { index in
                        Text("\(self.shareData.INTERVALS[index])秒").tag(index)
                    }
                }
            }
            Section(header: Text("セット数を変更する")){
                Picker(selection: $shareData.selectNumOfTimes, label: Text("繰り返し回数")) {
                    ForEach(0..<self.shareData.NUMBEROFTIMES.count) { index in
                        Text("\(self.shareData.NUMBEROFTIMES[index])セット").tag(index)
                    }
                }
            }
        }.navigationBarTitle("タイマーの設定")
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
        .environmentObject(ShareData())
    }
}
