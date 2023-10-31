//
//  TabBarButton.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct TabBarButton: View {
    
    let text: String
    @Binding var isSelected: Bool
    
    public var body: some View {
        
        Text(text)
            .fontWeight(isSelected ? .heavy : .regular)
            .font(.style(.SF14R))
    }
}
