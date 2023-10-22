//
//  MakgeolliDetail.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct MakgeolliDetail: View {
    var title: String
    var content: String
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .bold()
                .font(.system(size: 16))
                .foregroundColor(.white)
            Spacer()
                .frame(height: 10)
            Text(content)
                .bold()
                .font(.system(size: 14))
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(uiColor: .designSystem(.blackBlock)!))
        .cornerRadius(10)
    }
}
