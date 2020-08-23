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
                Picker(selection: $shareData.useAge, label: Text("年齢")) {
                    ForEach(0..<100) { index in
                        Text("\(index)歳").tag(index)
                    }
                }
            }
            // 性別
            Section(header: Text("性別を入力してください")){
                Picker(selection: $shareData.useAge, label: Text("性別")) {
                    ForEach(0..<100) { index in
                        Text("\(index)歳").tag(index)
                    }
                }
            }
            
            // 体重と身長
            Section(header: Text("体重と年齢を入力してください")){
                Picker(selection: $shareData.useAge, label: Text("体重")) {
                    ForEach(0..<100) { index in
                        Text("\(index)歳").tag(index)
                    }
                }
                Picker(selection: $shareData.useAge, label: Text("年齢")) {
                    ForEach(0..<100) { index in
                        Text("\(index)歳").tag(index)
                    }
                }
            }
            
            // 運動強度
            Section(header: Text("1週間の運動量を入力してください")){
                Picker(selection: $shareData.useAge, label: Text("運動レベル")) {
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
