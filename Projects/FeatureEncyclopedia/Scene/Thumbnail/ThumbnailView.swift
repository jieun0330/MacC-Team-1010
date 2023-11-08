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
            .foregroundColor(Color(uiColor: .designSystem(.darkgrey)!))
            .cornerRadius(18)
            .frame(width: 110, height: 210)
            .overlay {
                VStack {
                    Rectangle()
                        .frame(width: 56, height: 114)
                    Text(makId)
                        .font(.style(.SF12R))
                    
                    HStack(spacing: 14) {
                        
                        // like -> 노란색
                        if User.user1.likes.contains(makId) {
                            Image(uiImage: .designSystem(.likeLarge)!)
                            
                        // dislike -> 보라색
                        } else {
                            
                            Image(uiImage: .designSystem(.sorryLarge)!)

//                            Circle()
//                                .stroke(
//                                    LinearGradient(
//                                        stops: [
//                                            Gradient.Stop(color: Color(red: 0.68, green: 0.68, blue: 1),
//                                                          location: 0.00),
//                                            Gradient.Stop(color: Color(red: 0.46, green: 0.46, blue: 0.83),
//                                                          location: 0.44)
//                                        ],
//                                        startPoint: UnitPoint(x: 0.5, y: -1),
//                                        endPoint: UnitPoint(x: 0.5, y: 2)
//                                    ), lineWidth: 10)
//                                .frame(width: 5)
//                                .frame(width: 15)
//                                .foregroundColor(.purple)
                        }
                        
                        // 코멘트 색깔있는거
                        if User.user1.comments.contains(makId) {
                            Image(uiImage: .designSystem(.comment)!)
//                                .frame(width: 12)
//                                .foregroundColor(Color(uiColor: .designSystem(.alert)!))
//                                .foregroundColor(Color(uiColor: .designSystem(.w85)!))
                        // 코멘트 색깔없는거
                        } else {
                            Image(uiImage: .designSystem(.noComment)!)
//                                .frame(width: 12)
//                                .foregroundColor(Color(uiColor: .designSystem(.w10)!))
                        }
                        
                        // 찜 색깔있는거
                        if User.user1.bookmarks.contains(makId) {
                            Image(uiImage: .designSystem(.heartSmall)!)
//                                .frame(width: 15)
//                                .foregroundColor(Color(uiColor: .designSystem(.w85)!))
                        // 찜 색깔없는거
                        } else {
                            Image(uiImage: .designSystem(.heartSmallNoColor)!)
//                                .frame(width: 15)
//                                .foregroundColor(Color(uiColor: .designSystem(.w10)!))
                        }
                    }
                }
            }
    }
}
