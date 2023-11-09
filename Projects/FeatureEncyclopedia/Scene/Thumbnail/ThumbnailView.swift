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
    
    let makId: String
    let type: EncyclopediaType
    
    init(makId: String, type: EncyclopediaType) {
        self.makId = makId
        self.type = type
    }
    
    public var body: some View {
        Rectangle()
            .foregroundColor(.DarkGrey)
            .cornerRadius(18)
            .frame(width: 110, height: 210)
            .overlay {
                VStack {
                    Rectangle()
                        .frame(width: 56, height: 114)
                    Text(makId)
                        .SF12R()
                    
                    HStack(spacing: 14) {
                        
                        // like -> 노란색
                        if User.user1.likes.contains(makId) {
                            Image(uiImage: .designSystem(.likeLarge)!)
                            
                        // dislike -> 보라색
                        } else {
                            Image(uiImage: .designSystem(.sorryLarge)!)
                        }
                        
                        // 코멘트 색깔있는거
                        if User.user1.comments.contains(makId) {
                            Image(uiImage: .designSystem(.comment)!)

                        // 코멘트 색깔없는거
                        } else {
                            Image(uiImage: .designSystem(.noComment)!)
                        }
                        
                        // 찜 색깔있는거
                        if User.user1.bookmarks.contains(makId) {
                            Image(uiImage: .designSystem(.heartSmall)!)
                            
                        // 찜 색깔없는거
                        } else {
                            Image(uiImage: .designSystem(.heartSmallNoColor)!)
                        }
                    }
                }
            }
    }
}

