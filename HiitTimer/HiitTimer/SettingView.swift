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
    
    let TIMES = ["10", "20", "30", "40", "50", "60", "70", "80", "90", "100"]
    let INTERVALS = ["10", "20", "30", "40", "50", "60", "70", "80", "90", "100"]
    
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
                
                Text("TIME SELECT")
                    .font(.title)
                Picker(selection: $shareData.selectTime, label: Text("TIME SELECT")) {
                    ForEach(0..<TIMES.count) { index in
                        Text(self.TIMES[index]).tag(index)
                    }
                }.frame(width: 200)
                
                Divider()
                
                
                Text("INTERVAL SELECT")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                Picker(selection: $shareData.selectInterval, label: Text("INTERVAL SELECT")) {
                    ForEach(0..<INTERVALS.count) { index in
                        Text(self.INTERVALS[index]).tag(index)
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
