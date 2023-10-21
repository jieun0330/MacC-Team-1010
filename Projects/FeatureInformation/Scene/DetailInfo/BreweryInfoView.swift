//
//  BreweryInfoView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct BreweryInfoView: View {
    public init() {}
    public var body: some View {
        MakgeolliDetail(title: "양조장 정보", content: "충주시 중앙탑면 탄금대로 626\n02-403-5002")
    }
}

struct BreweryInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BreweryInfoView()
    }
}
