//
//  AdMobBarView.swift
//  HiitTimer
//
//  Created by がり on 2020/09/05.
//  Copyright © 2020 がり. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct AdMobBarView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        // 以下は、バナー広告向けのテスト専用広告ユニットIDです。自身の広告ユニットIDと置き換えてください。
        //ca-app-pub-3940256099942544/2934735716 テスト用ユニットID
        //"ca-app-pub-2238483683428820/6863193224"
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}

struct AdMobBarView_Previews: PreviewProvider {
    static var previews: some View {
        AdMobBarView()
    }
}
