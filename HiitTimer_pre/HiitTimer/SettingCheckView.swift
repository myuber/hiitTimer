//
//  SettingCheckView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/23.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI


struct SettingCheckView: View {
    // 共有のデータを保持する
    @EnvironmentObject var shareData: ShareData
    @ObservedObject var countdowntimer: CountDownTimer
    
    var body: some View {
        
        VStack {
            HStack(spacing: 0.0) {
                Text("運動：\(self.countdowntimer.counter)秒")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40.0)
                    .foregroundColor(.white)
                    .background(Color(.systemPink))
                Text("休憩：\(self.countdowntimer.interval)秒")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40.0)
                    .foregroundColor(.white)
                    .background(Color(.systemTeal))
            }
            Text("セット：\(self.countdowntimer.numOfTimes)回")
                .font(.title)
            .frame(maxWidth: .infinity)
            .frame(height: 40.0)
            .foregroundColor(.white)
            .background(Color(.systemOrange))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80.0)

    }
}

struct SettingCheckView_Previews: PreviewProvider {
    static var cdt = CountDownTimer(5, 10, 8)
    
    static var previews: some View {
        SettingCheckView(countdowntimer: cdt)
            .environmentObject(ShareData())
    }
}
