//
//  ContentView.swift
//  HiitTimer
//
//  Created by がり on 2020/08/06.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // 共有するデータを保持
    @EnvironmentObject var shareData: ShareData
    
    // 表示タブを切り替える変数を定義
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            
            TimerView()
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Hiitタイマー")
                    }
                }
                .tag(0)
            
            CalcView()
                .tabItem {
                    VStack {
                        Image("second")
                        Text("TDEE計算")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ShareData())
    }
}
