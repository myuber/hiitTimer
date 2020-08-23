//
//  CalcView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/06.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct CalcView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: CalcInputView()){
                    Text("TDEE計算ページ")
                }
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
