//
//  ShareData.swift
//  HiitTimer
//
//  Created by がり on 2020/08/10.
//  Copyright © 2020 がり. All rights reserved.
//

import Foundation

// 共有するデータ
class ShareData: ObservableObject {
    // TimerViewに使用するデータ
    @Published var selectTime = 1
    @Published var selectInterval = 2
    @Published var selectNumOfTimes = 7
    
    @Published var TIMES = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140 ,150, 160, 170, 180]
    @Published var INTERVALS = [1, 5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    @Published var NUMBEROFTIMES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    
    // CalcViewに使用するデータ
    @Published var userBMR = 0 //基礎代謝
    @Published var userTDEE = 0 //TDEE
    
    @Published var userProtein = 0 //タンパク質(TDEE÷20%÷4kcal)
    // userLoseWeightModeがtrueならこっち
    @Published var userCarbohydrateLoseWeight = 0 //炭水化物(TDEE÷30%÷4kcal)
    @Published var userLipidLoseWeight = 0 //脂質(TDEE÷30%÷9kcal)
    // userLoseWeightModeがfalseならこっち
    @Published var userCarbohydrateMaintainWeight = 0 //炭水化物(TDEE÷40%÷4kcal)
    @Published var userLipidMaintainWeight = 0 //脂質(TDEE÷40%÷9kcal)
}
