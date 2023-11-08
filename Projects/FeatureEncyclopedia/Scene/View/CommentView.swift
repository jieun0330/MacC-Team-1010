//
//  CommentView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core
import FeatureHome

public struct CommentView: View {
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    let type = EncyclopediaType.comment
    
//    extension ThumbnailView {
//        self.makId = makId
//    }
    
//    let comment: Comment
    
    public var body: some View {
        
        ScrollView {
            
            VStack {
                HStack {
                    Text("\((User.user1.comments).count)개의 막걸리에 코멘트를 남겼어요")
                        .font(.style(.SF12R))
                        .foregroundColor(Color(uiColor: .designSystem(.w50)!))
    //                    .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.vertical, 10)
                .padding(.leading, 5)
                
                
//                ForEach(User.user1.comments, id: \.self) { makId in
                    HStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(uiColor: .designSystem(.darkgrey)!))
                            .frame(width: 60, height: 80)
                            .padding(.trailing, 16)
                        
                        VStack {
                            HStack {
                                Text(ThumbnailView(makId: $makId))
                                    
                            }
                        }
                        
                        Spacer()
                        
                        
                    }
//                }
                

                
                //                ForEach(User.user1.comments, id: \.self) { makId in
                //
                //
                //                    ThumbnailView(makId: makId, type: .comment)
                //                }
                
//                HStack(spacing: 0) {
//                    RoundedRectangle(cornerRadius: 12)
//                        .fill(Color(uiColor: .designSystem(.darkgrey)!))
//                        .frame(width: 60, height: 80)
//                        .padding(.trailing, 16)
//
//                    VStack(alignment: .leading, spacing: 0) {
//                        HStack(spacing: 0) {
//                            Text(comment.makHolyId)
//                                .font(.style(.SF14R))
//                                .foregroundColor(Color(uiColor: .designSystem(.white)!))
//                            Image(uiImage: .designSystem(.like)!)
//                                .padding(.leading, 4)
//                            Spacer()
//                            Text(comment.userId)
//                                .font(.style(.SF14R))
//                                .foregroundColor(Color(uiColor: .designSystem(.w25)!))
//                        }
//                        .padding(.bottom, 3)
//                        Text(comment.description)
//                            .lineLimit(2)
//                            .font(.style(.SF14R))
//                            .foregroundColor(Color(uiColor: .designSystem(.w85)!))
//                        Spacer()
//                        Text(comment.date)
//                            .font(.style(.SF14R))
//                            .foregroundColor(Color(uiColor: .designSystem(.w25)!))
//                    }
//                    Spacer()
//                }
                
//                HStack {
//                   LatestCommentSingleView()
//                }
                
                
            }
            
//            LazyVGrid(columns: columns, spacing: 16, content: {
//
//
//
//                ForEach(User.user1.comments, id: \.self) { makId in
//
//
//                    ThumbnailView(makId: makId, type: .comment)
//                }
//            })
        }
    }
}
