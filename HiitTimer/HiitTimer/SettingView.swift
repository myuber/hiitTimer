//
//  SettingView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/19.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @State var trainingTime:Int
    @State var intervalTime:Int
    @State var numOfTimes:Int
    
    let TIMES = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    let INTERVALS = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    let NUMBEROFTIMES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
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
                Text("\(trainingTime)")
                Picker(selection: $trainingTime, label: Text("TIME SELECT")) {
                    ForEach(0..<self.TIMES.count) { index in
                        Text("\(self.TIMES[index])").tag(index)
                    }
                }.frame(width: 200)
                
                // 区切り線
                Divider()
                
                Text("INTERVAL TIME")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                Picker(selection:$intervalTime, label: Text("INTERVAL SELECT")) {
                    ForEach(0..<self.INTERVALS.count) { index in
                        Text("\(self.INTERVALS[index])").tag(index)
                    }
                }.frame(width: 200)
                
                // 区切り線
                Divider()
                
                Text("NUMBER OF TIMES")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                
                Picker(selection: $numOfTimes, label: Text("NUMBER OF TIMES SELECT")) {
                    ForEach(0..<self.NUMBEROFTIMES.count) { index in
                        Text("\(self.NUMBEROFTIMES[index])").tag(index)
                    }
                }.frame(width: 200)
            }
        }
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(trainingTime: 1, intervalTime:0, numOfTimes: 7)
    }
}
