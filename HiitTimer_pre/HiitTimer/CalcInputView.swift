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
    
    @State var weight:String = ""
    @State var height:String = ""
    
    var EXSERCISEPATTERN = [
        "普段は全く運動をしていない",
        "週1〜2回程度、運動している",
        "週2〜3回程度、運動している",
        "週3〜4回程度、運動している",
        "ほぼ毎日激しい運動をしている"
    ]
    
    var body: some View {
        NavigationView{
            Form{
                // 年齢
                Section(header: Text("年齢を選択してください")){
                    Picker(selection: $shareData.userAge, label: Text("年齢")) {
                        ForEach(0..<100) { index in
                            Text("\(index)歳").tag(index)
                        }
                    }
                }
                // 性別
                Section(header: Text("性別を選択してください")){
                    Picker(selection: $shareData.userGender, label: Text("性別")) {
                        Text("女性").tag("female")
                        Text("男性").tag("male")
                    }
                }
                
                // 体重と身長
                Section(header: Text("体重と年齢を入力してください")){
                    
                    HStack {
                        TextField("体重(kg)",text: $weight).keyboardType(.numberPad)
                        Text("kg")
                            .foregroundColor(Color.gray)
                    }
                    HStack {
                        TextField("身長(cm)",text: $height).keyboardType(.numberPad)
                        Text("cm")
                            .foregroundColor(Color.gray)
                    }
                }
                
                // 運動強度
                Section(header: Text("1週間の運動量を選択してください")){
                    Picker(selection: $shareData.userAge, label: Text("運動レベル")) {
                        ForEach(0 ..< EXSERCISEPATTERN.count) { index in
                            Text("\(self.EXSERCISEPATTERN[index])").tag(index)
                        }
                    }
                }
            }.navigationBarItems(trailing: Button(action: {
                
            }) {
                Text("TDEEを計算する")
            })
        }
    }
}

struct CalcInputView_Previews: PreviewProvider {
    static var previews: some View {
        CalcInputView()
            .environmentObject(ShareData())
    }
}
