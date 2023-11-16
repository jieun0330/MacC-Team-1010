//
//  CommentContentsView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/16.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

struct CommentContentsView: View {
    
    @StateObject var viewModel = EncyclopediaViewModel(userRepository: DefaultUserRepository())
    @State private var showActionSheet = false
    
    var body: some View {
        ForEach(viewModel.makModel, id: \.self) { mak in
            Button {
                if let id = mak.makSeq {
                    viewModel.resultMakHolyId = id
                }
            } label: {
                HStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.DarkGrey)
                        .frame(width: 60, height: 80)
                        .overlay(
                            MakHolyImageView(imageId: mak.makImg!, type: .mini)
                        )
                    VStack(alignment: .leading) {
                        HStack {
                            Text(mak.makNm ?? "")
                                .foregroundColor(.White)
                                .SF14R()
                            
                            Image(uiImage: .designSystem(.like)!)
                            Spacer()
                            
                            if mak.cmVisibility == "N" {
                                Image(uiImage: .designSystem(.lock)!)
                            }
                        }
                        
                        Text(mak.reactionComment ?? "")
                            .SF14R()
                            .foregroundColor(.W85)
                        
                        Spacer()
                            .frame(height: 20)
                        
                        HStack {
                            Text(mak.reactionCommentDate?.extractDateFromISOString() ?? "")
                                .SF14R()
                                .foregroundColor(.W25)
                            
                            Spacer()
                            
//                                            Button {
//                                                self.targetMak = mak
//                                                showActionSheet = true
//                                            } label: {
//                                                Text("수정")
//                                                    .SF12R()
//                                            }
                            
                            Button {
                                showActionSheet.toggle()
//                                                viewModel.showCommentSheet.toggle()
                            } label: {
                                Text("수정")
                                    .SF12R()
                                    
                            }
                            
                            
                        }
                    }
                    .padding(.leading)
                }
            }
            .onAppear {
                if mak == viewModel.makModel.last {
                    if !viewModel.isLastPage {
                        var offset = viewModel.currentOffset
                        offset += 1
                        withAnimation {
                            viewModel.getUserMakFolder(segmentName: "comment", offset: offset)
                        }
                    }
                }
            }
            .padding()
            if mak != viewModel.makModel.last {
                DividerView()
                    .padding(.horizontal, 16)
            }
        }
    }
}

//struct CommentContentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentContentsView()
//    }
//}
