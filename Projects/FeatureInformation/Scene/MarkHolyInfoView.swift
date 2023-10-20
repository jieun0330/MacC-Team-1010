//
//  MarkHolyInfoView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct MarkHolyInfoView: View {
    public init() {}
    public var body: some View {
        MarkHolyDetail(title: "정보", content: "담백하고 깔끔한 맛이 특징으로, 단맛과 신맛, 알코올이 균형을 맞춘 술입니다.")
    }
}

struct MarkHolyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MarkHolyInfoView()
    }
}
