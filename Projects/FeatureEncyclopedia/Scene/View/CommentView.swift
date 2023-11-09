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
    @State private var showActionSheet = false
    @State private var showModal = false
    
    public var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("\((User.user1.comments).count)개의 막걸리에 코멘트를 남겼어요")
                        .SF12R()
                        .foregroundColor(.W50)
                    Spacer()
                }
                .padding(.vertical, 10)
                .padding(.leading, 5)
                ForEach(User.user1.comments, id: \.self) { makId in
                    
                    ForEach(Comment.mokDatas, id: \.self) { comment in
                        if comment.makHolyId == makId {
                            HStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(.DarkGrey)
                                    .frame(width: 60, height: 80)
                                    .padding(.trailing, 16)
                                VStack(alignment: .leading) {
                                    
                                    HStack {
                                        Text(makId)
                                            .SF14R()
                                        Image(uiImage: .designSystem(.like)!)
                                            .padding(.leading, 4)
                                        Spacer()
                                    }
                                    .padding(.bottom, 3)
                                    
                                    Text(comment.description)
                                        .SF14R()
                                        .lineLimit(2)
                                        .foregroundColor(.W85)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Text(comment.date)
                                            .SF14R()
                                            .foregroundColor(.W25)
                                        
                                        Spacer()
                                        
                                        Button {
                                            showActionSheet = true
                                        } label: {
                                            Text("수정")
                                                .SF12R()
                                                .foregroundColor(.primary)
                                        }
                                        .confirmationDialog("", isPresented: $showActionSheet, titleVisibility: .hidden) {
                                            
                                            Button("수정하기") { self.showModal = true }
                                                .sheet(isPresented: self.$showModal) {
                                                    CommentEditView()
                                                }
                                            Button("삭제하기", role: .destructive) { }
                                            Button("취소하기", role: .cancel) { }
                                            
                                        }
                                    }
                                }
                            }
                            Divider()
                        }
                    }
                }
            }
        }
    }
}
