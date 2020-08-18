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
    @Published var selectTime = 20
    @Published var selectInterval = 10
    @Published var selectNumOfTimes = 8
    
    @Published var TIMES = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    @Published var INTERVALS = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    @Published var NUMBEROFTIMES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
}
