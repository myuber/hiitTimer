//
//  CalcInputView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/24.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct CalcInputView: View {
    // 共有のデータを保持する
    @EnvironmentObject var shareData: ShareData
    
    var body: some View {
        Form{
            // 年齢
            Section(header: Text("年齢を入力してください")){
                Picker(selection: $shareData.userAge, label: Text("年齢")) {
                    ForEach(0..<100) { index in
                        Text("\(index)歳").tag(index)
                    }
                }
            }
            // 性別
            Section(header: Text("性別を入力してください")){
                Picker(selection: $shareData.userGender, label: Text("性別")) {
                    Text("女性").tag("female")
                    Text("男性").tag("male")
                }
            }
            
            // 体重と身長
            Section(header: Text("体重と年齢を入力してください")){
                Picker(selection: $shareData.userWeight, label: Text("体重")) {
                    ForEach(30..<150) { index in
                        Text("\(index)kg").tag(index)
                    }
                }
                Picker(selection: $shareData.userHeight, label: Text("身長")) {
                    ForEach(130..<200) { index in
                        Text("\(index)cm").tag(index)
                    }
                }
            }
            
            // 運動強度
            Section(header: Text("1週間の運動量を入力してください")){
                Picker(selection: $shareData.userAge, label: Text("運動レベル")) {
                    ForEach(0..<100) { index in
                        Text("\(index)歳").tag(index)
                    }
                }
            }
        }
    }
}

struct CalcInputView_Previews: PreviewProvider {
    static var previews: some View {
        CalcInputView()
            .environmentObject(ShareData())
    }
}
