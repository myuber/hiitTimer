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
        ZStack{
            
            // 背景
            Color(red: 0.9, green: 0.9, blue: 0.8)
                .edgesIgnoringSafeArea(.all)
                .overlay( Capsule()
                    .foregroundColor(.black)
                    .opacity(0.2)
                    .frame(width: 100, height: 8)
                    .padding()
                    , alignment: .top )
            VStack {
                Spacer()

                Text("TRAINING TIME")
                    .font(.title)
                Text("\(shareData.selectTime)")
                Picker(selection: $shareData.selectTime, label: Text("TIME SELECT")) {
                    ForEach(0..<self.shareData.TIMES.count) { index in
                        Text("\(self.shareData.TIMES[index])").tag(index)
                    }
                }.frame(width: 200)
                
                // 区切り線
                Divider()
                
                Text("INTERVAL TIME")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                Picker(selection: $shareData.selectInterval, label: Text("INTERVAL SELECT")) {
                    ForEach(0..<self.shareData.INTERVALS.count) { index in
                        Text("\(self.shareData.INTERVALS[index])").tag(index)
                    }
                }.frame(width: 200)
                
                // 区切り線
                Divider()
                
                Text("NUMBER OF TIMES")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                Picker(selection: $shareData.selectNumOfTimes, label: Text("NUMBER OF TIMES SELECT")) {
                    ForEach(0..<self.shareData.NUMBEROFTIMES.count) { index in
                        Text("\(self.shareData.NUMBEROFTIMES[index])").tag(index)
                    }
                }.frame(width: 200)
                
            }
        }
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
        .environmentObject(ShareData())
    }
}
