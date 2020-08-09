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
    @Published var selectInterval = 20
}
