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
    @Published var selectTime = 3
    @Published var selectInterval = 3
    
    @Published var TIMES = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    @Published var INTERVALS = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
}
