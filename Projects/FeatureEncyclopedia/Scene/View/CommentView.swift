//
//  CommentView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

// 코멘트 뷰
public struct CommentView: View {
    @ObservedObject var viewModel: EncyclopediaViewModel
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    @State private var showActionSheet = false
    @State private var showModal = false
    @State private var showingAlert = false
    
    public var body: some View {
        ScrollView {
            VStack {
                HStack {
                    
                    Text("\((viewModel.makModel.filter {$0.reactionComment != nil}).count )개의 막걸리에 코멘트를 남겼어요")
                        .SF12R()
                        .foregroundColor(.W50)
                    Spacer()
                }
                .padding(.vertical, 10)
                .padding(.leading, 5)
                
                ForEach(viewModel.makModel, id: \.self) { mak in
                    if mak.reactionComment != nil {
                        HStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.DarkGrey)
                                .frame(width: 60, height: 80)
                                .overlay(
                                    MakHolyImageView(imageId: mak.makImg!, type: .mini)
                                )
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(mak.makNm!)
                                        .foregroundColor(.White)
                                        .SF14R()
                                    Image(uiImage: .designSystem(.like)!)
                                        .padding(.leading, 4)
                                    Spacer()
                                    Image(uiImage: .designSystem(.lock)!)
                                }
                                
                                Spacer()
                                
                                Text(mak.reactionComment!)
                                    .SF14R()
                                    .lineLimit(2)
                                    .foregroundColor(.W85)
                                
                                Spacer()
                                
                                HStack {
                                    Text(mak.reactionCommentDate!)
                                        .SF14R()
                                        .foregroundColor(.W25)
                                    
                                    Spacer()
                                    
                                    Button {
                                        showActionSheet.toggle()
                                    } label: {
                                        Text("수정")
                                            .SF12R()
                                    }
                                    .confirmationDialog("", isPresented: $showActionSheet, titleVisibility: .hidden) {
                                        
                                        Button("수정하기") {
                                            showModal = true
                                        }
                                        
                                        Button("삭제하기", role: .destructive) {
                                            showingAlert = true
                                        }
                                        
                                        Button("취소하기", role: .cancel) { }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        Divider()
                    }
                }
            }
        }
        .onAppear {
            UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self])
                .tintColor = UIColor(named: "Primary")
        }
        .sheet(isPresented: $showModal) {
            CommentEditView(showModal: $showModal)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("코멘트 삭제"),
                  message: Text("코멘트를 삭제하시겠어요?"),
                  primaryButton: .default(
                    Text("취소")
                  ),
                  secondaryButton: .destructive(
                    Text("삭제하기")
                  )
            )
        }
    }
}
