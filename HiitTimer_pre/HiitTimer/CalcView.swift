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
                Toggle(isOn: $userLoseWeightMode) {
                    HStack {
                        Image(systemName: userLoseWeightMode ? "flame" : "star.fill")
                            .frame(width: 70, height: 70)
                            .font(.system(size: 50))
                            .foregroundColor(userLoseWeightMode ? Color.red : Color.blue)
                        
                        
                        VStack(alignment: .leading) {
                            Text("体脂肪を")
                                .font(.title)
                            Text(userLoseWeightMode ? "減らしたいとき" : "維持したいとき")
                                .font(.title)
                                .foregroundColor(userLoseWeightMode ? Color.red : Color.blue)
                        }
                    }
                }.padding()
                
                Divider()
                Text("基礎代謝/ \(self.shareData.userBMR)kcal")
                Text("TDEE/ \(self.shareData.userTDEE)kcal")
                
                Divider()
                
                Text("炭水化物/ \(userLoseWeightMode ? self.shareData.userCarbohydrateLoseWeight : self.shareData.userCarbohydrateMaintainWeight)g")
                Text("タンパク質/ \(self.shareData.userProtein)g")
                Text("脂質/ \(userLoseWeightMode ? self.shareData.userLipidLoseWeight : self.shareData.userLipidMaintainWeight)g")
                Divider().padding(.bottom, 20.0)
            
                NavigationLink(destination: CalcInputView()){
                    Text("TDEEを計算する")
                        .font(.title)
                        .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 20)
                        .frame(width: 300, height: 40)
                        .foregroundColor(Color.pink))
                    
                }
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
