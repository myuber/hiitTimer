//
//  CalcTextView.swift
//  HiitTimer
//
//  Created by がり on 2020/10/10.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI

struct CalcTextView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack (alignment: .leading) {
                
                Text("アプリの各数値について")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(20.0)
                    .foregroundColor(Color(.white))
                    .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                    .frame(maxWidth: .infinity)
                    
                        
                VStack(alignment: .leading) {
                    Text("1.TDEE/基礎代謝とは")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    Text(
                        "・基礎代謝とは何もせずじっとしている時でも、心拍や呼吸・体温の維持などで消費される必要最小限のエネルギー量のことです。\n・TDEEとは「Total Daily Energy Expenditure」の略で、基礎代謝に運動などの一日の活動カロリーを足したもので、一日の総消費カロリーのことをいいます。"
                    )
                        .font(.caption)
                        .padding(.leading, 10.0)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        
                    Button(action: {
                        if let url = URL(string: "https://www.e-healthnet.mhlw.go.jp/information/dictionary/metabolic/ym-019.html") {
                            UIApplication.shared.open(url, options: [.universalLinksOnly: false], completionHandler: {completed in
                                print(completed)
                            })
                        }
                    }
                    ){
                        Text("参照:基礎代謝とは（厚生労働省HP）")
                            .font(.caption)
                            .padding(.leading, 10.0)
                    }
                }
                    .padding(.top, 10)
                    .padding(.bottom, 40)
                
                VStack(alignment: .leading) {
                    Text("2.基礎代謝の計算方法")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    Text(
                        "基礎代謝量の計算には、ハリス・ベネディクトの式を使用しています。\n【男性】 13.397 × 体重kg + 4.799 x 身長cm - 5.677 × 年齢 + 88.362\n【女性】 9.247 × 体重kg + 3.098 x 身長cm - 4.33 × 年齢 + 447.593"
                    )
                        .font(.caption)
                        .padding(.leading, 10.0)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding(.bottom, 40)
                
                VStack(alignment: .leading) {
                    Text("3.TDEEの計算方法")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    Text(
                        "【1】普段は全く運動をしていない (基礎代謝 × 1.2)\n【2】週1〜2回程度、運動している (基礎代謝 × 1.375)\n【3】週2〜3回程度、運動している (基礎代謝 × 1.55)\n【4】週3〜4回程度、運動している (基礎代謝 × 1.725)\n【5】ほぼ毎日激しい運動をしている (基礎代謝 × 1.9)"
                    )
                        .font(.caption)
                        .padding(.leading, 10.0)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding(.bottom, 40)
                
                VStack(alignment: .leading) {
                    Text("4.三大栄養素の計算方法")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    Text(
                        "▼【体脂肪を減らしたいとき】\n・炭水化物 = TDEE×30%÷4kcal\n・タンパク質 = TDEE×20%÷4kcal\n・脂質 = TDEE×30%÷9kcal\n\n▼【体脂肪を維持したいとき】\n・炭水化物 = TDEE×40%÷4kcal\n・タンパク質 = TDEE×20%÷4kcal\n・脂質 = TDEE×40%÷9kcal"
                    )
                        .font(.caption)
                        .padding(.leading, 10.0)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding(.bottom, 40)
                
                VStack(alignment: .leading) {
                    Text("5.数値データの注意点")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    Text(
                        "このアプリのデータは、上記の計算式で算出された数値になります。医療データとしては参考にしないでください。"
                    )
                        .font(.caption)
                        .padding(.leading, 10.0)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding(.bottom, 40)
            }.padding(10)
        }
    }
}

struct CalcTextView_Previews: PreviewProvider {
    static var previews: some View {
        CalcTextView()
    }
}
