//
//  InfoView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/21.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

public struct InfoRow: View {
    
    var title: String
    var value: String
    
    public var body: some View {
        HStack {
            Text(title)
                .opacity(0.5)
                .padding(.trailing, 16)
            Text(value)
                .font(.system(size: 16))
        }
    }
}
