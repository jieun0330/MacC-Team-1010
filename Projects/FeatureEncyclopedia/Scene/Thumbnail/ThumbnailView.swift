//
//  ThumbnailView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

public struct ThumbnailView: View {
    
    let mak: GetUserMakFolderContent
    let type: EncyclopediaType
    
    init(mak: GetUserMakFolderContent, type: EncyclopediaType) {
        self.mak = mak
        self.type = type
    }
    
    public var body: some View {
        Rectangle()
            .foregroundColor(.DarkGrey)
            .cornerRadius(18)
            .frame(width: 110, height: 210)
            .overlay {
                VStack {
                    MakHolyImageView(imageId: mak.makImg!, type: .middle)
                    
                    Text(mak.makNm!)
                        .SF12R()
                        .lineLimit(1)
                        .padding(.horizontal)
                    
                    HStack(spacing: 14) {
                        
                        // like -> 노란색
                        if mak.reactionLike == "LIKE" {
                            Image(uiImage: .designSystem(.likeLarge)!)
                            // dislike -> 보라색
                        } else if mak.reactionLike == "DISLIKE" {
                            Image(uiImage: .designSystem(.sorryLarge)!)
                            // 아무것도 안눌렀을 시
                        } else {
                            Image(uiImage: .designSystem(.nothingLike)!)
                        }
                        
                        // 코멘트 색깔없는거
                        if mak.reactionComment == nil {
                            Image(uiImage: .designSystem(.noComment)!)
                            // 코멘트 색깔있는거
                        } else {
                            Image(uiImage: .designSystem(.comment)!)
                        }
                        
                        // 찜 색깔있는거
                        if mak.reactionWish == "WISH" {
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

