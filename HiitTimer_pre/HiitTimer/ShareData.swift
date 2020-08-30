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
    @Published var selectInterval = 0
    @Published var selectNumOfTimes = 7
    
    @Published var TIMES = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    @Published var INTERVALS = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    @Published var NUMBEROFTIMES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    // CalcViewに使用するデータ
    @Published var userBMR = 0 //基礎代謝
    @Published var userTDEE = 0 //TDEE
}
