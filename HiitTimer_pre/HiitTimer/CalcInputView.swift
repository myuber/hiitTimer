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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var age:Int = 25
    @State var weight:String = "60"
    @State var height:String = "160"
    @State var gender:String = "female"
    @State var exercise:Double = 1.375
    
    
    fileprivate func TextCheck() -> Bool {
        // Intに変換できなかったらfalse
        guard let _ = Int(weight),
            let _ = Int(height) else { return false }
        // Intに変換できたらtrue
        return true
    }
    
    fileprivate func FemaleCalcTdee() -> Double {
        let ageNum:Double = Double(age)
        
        if let weightNum = Double(weight),
            let heightNum = Double(height) {
                let result = 9.247 * weightNum + 3.098 * heightNum - 4.33 * ageNum + 447.593
                return result
                
        } else {
            return -1
        }
    }
    
    fileprivate func MaleCalcTdee() -> Double {
        let ageNum:Double = Double(age)
        if let weightNum = Double(weight),
            let heightNum = Double(height) {
                let result = 13.397 * weightNum + 4.799 * heightNum - 5.677 * ageNum + 88.362
                return result
                
        } else {
            return -1
        }
    }
    
    
    fileprivate func CalcUserData() {
        self.shareData.userTDEE = Int(Double(self.shareData.userBMR) * self.exercise)
        self.shareData.userProtein = Int(Double(self.shareData.userTDEE) * 0.2 / 4) //タンパク質(TDEEの20%÷4kcal)
        // 体脂肪を減らす際の摂取カロリー
        self.shareData.userCarbohydrateLoseWeight = Int(Double(self.shareData.userTDEE) * 0.3 / 4) //炭水化物(TDEEの30%÷4kcal)
        self.shareData.userLipidLoseWeight = Int(Double(self.shareData.userTDEE) * 0.3 / 9) //脂質(TDEEの30%÷9kcal)
        // 体脂肪を維持する際の摂取カロリー
        self.shareData.userCarbohydrateMaintainWeight = Int(Double(self.shareData.userTDEE) * 0.4 / 4) //炭水化物(TDEEの40%÷4kcal)
        self.shareData.userLipidMaintainWeight = Int(Double(self.shareData.userTDEE) * 0.4 / 9) //脂質(TDEEの40%÷9kcal)
    }
    
    var body: some View {
        VStack{
            Form{
                // 年齢
                Section(header: Text("年齢を選択してください")){
                    Picker(selection: $age, label: Text("年齢")) {
                        ForEach(0..<100) { index in
                            Text("\(index)歳").tag(index)
                        }
                    }
                }
                
                // 性別
                Section(header: Text("性別を選択してください")){
                    Picker(selection: $gender, label: Text("性別")) {
                        Text("女性").tag("female")
                        Text("男性").tag("male")
                    }
                }
                
                // 体重と身長
                Section(header: Text("体重と年齢を入力してください")){
                    HStack {
                        TextField("身長(cm)",text: $height).keyboardType(.numberPad)
                        Text("cm")
                            .foregroundColor(Color.gray)
                    }
                    HStack {
                        TextField("体重(kg)",text: $weight).keyboardType(.numberPad)
                        Text("kg")
                            .foregroundColor(Color.gray)
                    }
                }
                
                // 運動強度
                Section(header: Text("1週間の運動量を選択してください")){
                    Picker(selection: $exercise, label: Text("運動レベル")) {
                        Text("普段は全く運動をしていない").tag(1.2)
                        Text("週1〜2回程度、運動している").tag(1.375)
                        Text("週2〜3回程度、運動している").tag(1.55)
                        Text("週3〜4回程度、運動している").tag(1.725)
                        Text("ほぼ毎日激しい運動をしている").tag(1.9)
                    }
                }
            }
            
            Spacer()
        
            Button(action: {
                if self.TextCheck(){
                    if self.gender == "male"{
                        self.shareData.userBMR = Int(self.MaleCalcTdee())
                        self.CalcUserData()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        self.shareData.userBMR = Int(self.FemaleCalcTdee())
                        self.CalcUserData()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }){
                Text("TDEEを計算する")
                    .font(.title)
                        .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 20)
                        .frame(width: 300, height: 40)
                        .foregroundColor(Color.pink))
                
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
