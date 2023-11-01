//
//  ThumbnailView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

public struct ThumbnailView: View {
    
    let model: Thumbnail
    
    public var body: some View {
        
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color(uiColor: .designSystem(.darkgrey)!))
                .cornerRadius(10)
                .frame(height: 190)
                .overlay(
                    VStack {
                        HStack {
                            model.comment
                            Spacer()
                            model.save
                                .foregroundColor(Color(uiColor: .designSystem(.goldenyellow)!))
                        }
                        .padding(.horizontal, 10)
                        model.makgeolliImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 66, height: 136)
                    }
                )
            HStack {
                model.product
                Text(model.title)
            }
            .font(.style(.SF14R))
        }
    }
}
