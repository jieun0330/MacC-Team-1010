//
//  PairingFoodView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct PairingFoodView: View {
    public init() {}
    public var body: some View {
        MarkHolyDetail(title: "어울리는 음식", content: "파스타, 소고기, 생선회, 빈대떡")
    }
}

struct PairingFoodView_Previews: PreviewProvider {
    static var previews: some View {
        PairingFoodView()
    }
}
