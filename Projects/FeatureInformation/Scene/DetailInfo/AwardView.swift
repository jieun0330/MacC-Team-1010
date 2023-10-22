//
//  IngredientsView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct AwardView: View {
    public init() {}
    public var body: some View {
        MakgeolliDetail(title: "수상", content: "2022우리술품평회\n농림축산식품부장관상")
    }
}

struct AwardView_Previews: PreviewProvider {
    static var previews: some View {
        AwardView()
    }
}
