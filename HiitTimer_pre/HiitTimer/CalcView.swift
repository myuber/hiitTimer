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
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: CalcInputView()){
                    Text("TDEE計算ページ")
                }
                Text("年齢\(self.shareData.userAge)")
                Text("性別\(self.shareData.userGender)")
                Text("体重\(self.shareData.userWeight)")
                Text("身長\(self.shareData.userHeight)")
            }
        }
    }
}

struct CalcView_Previews: PreviewProvider {
    static var previews: some View {
        CalcView()
            .environmentObject(ShareData())
    }
}
