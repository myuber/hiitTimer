//
//  CalcView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/06.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct CalcView: View {
    // 共有のデータを保持する
    @EnvironmentObject var shareData: ShareData
    
    @State var userLoseWeightMode = true
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: CalcInputView()){
                    Text("TDEE計算ページ")
                }
                Toggle(isOn: $userLoseWeightMode) {
                    VStack(alignment: .leading) {
                        Text("体脂肪を")
                            .font(.title)
                        Text(userLoseWeightMode ? "減らしたいとき" : "維持したいとき")
                            .font(.title)
                            .foregroundColor(userLoseWeightMode ? Color.red : Color.blue)
                    }
                }.padding()
                
                Divider()
                Text("基礎代謝/ \(self.shareData.userBMR)kcal")
                Text("TDEE/ \(self.shareData.userTDEE)kcal")
                
                Divider()
                
                Text("炭水化物/ \(userLoseWeightMode ? self.shareData.userCarbohydrateLoseWeight : self.shareData.userCarbohydrateMaintainWeight)g")
                Text("タンパク質/ \(self.shareData.userProtein)g")
                Text("脂質/ \(userLoseWeightMode ? self.shareData.userLipidLoseWeight : self.shareData.userLipidMaintainWeight)g")
                Divider()
                
            }
            Spacer()
        }
    }
}

struct CalcView_Previews: PreviewProvider {
    static var previews: some View {
        CalcView()
            .environmentObject(ShareData())
    }
}
