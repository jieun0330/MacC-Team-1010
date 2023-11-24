//
//  CommentView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import FeatureInformation

public struct CommentView: View {
    @StateObject var viewModel = EncyclopediaViewModel(userRepository: DefaultUserRepository())
    
    @State private var showActionSheet = false
    @State private var showModal = false
    @State private var showingAlert = false
    @State var targetMak: GetUserMakFolderContent? = nil
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    public var body: some View {
        if viewModel.fetchLoading {
            ProgressView()
				.modifier(ProgressViewBackground())
                .onAppear {
                    viewModel.getUserMakFolder(segmentName: "comment")
                }
                .alert(isPresented: $viewModel.errorState) {
                    Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
                          dismissButton: .default(Text("확인")))
                }
        } else {
            if viewModel.makModel.isEmpty {
                isemptyView()
            } else {
                ScrollView {
                    VStack {
                        headerView()
                        
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
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                            .frame(height: 20)
                                        
                                        HStack {
											Text(mak.reactionCommentDate?.formattedTimeAgo() ?? "")
                                                .SF14R()
                                                .foregroundColor(.W25)
                                            
                                            Spacer()
                                            
                                            Button {
                                                showActionSheet.toggle()
                                                self.targetMak = mak
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
                .fullScreenCover(item: $viewModel.resultMakHolyId) { makHolyId in
                    InformationView(makHolyId: makHolyId)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("코멘트 삭제"),
                          message: Text("코멘트를 삭제하시겠어요?"),
                          primaryButton: .default(
                            Text("취소")
                          ),
                          secondaryButton: .destructive(
                            Text("삭제하기"),
                            action: {
                                viewModel.deleteComment(makSeq: targetMak!.makSeq!)
                            }
                          )
                    )
                }
                .sheet(isPresented: $showModal) {
                    CommentEditView(showModal: $showModal,
                                    initialComment: targetMak!.reactionComment!,
                                    viewModel: viewModel,
                                    mak: targetMak!,
                                    isSecretSelected: targetMak!.cmVisibility == "N" ? true : false)
                }
                .confirmationDialog("", isPresented: $showActionSheet,
                                    titleVisibility: .hidden) {
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
}

extension CommentView {
    @ViewBuilder
    func isemptyView() -> some View {
        VStack(spacing: 20) {
            Spacer()
            Text("비어있어요..")
                .SF17R()
                .foregroundColor(.W50)
            Image(uiImage: .designSystem(.character)!)
            Spacer()
        }
    }
    
    @ViewBuilder
    func headerView() -> some View {
        HStack {
            Text("\((viewModel.makModel).count)개의 막걸리에 코멘트를 남겼어요")
                .SF12R()
                .foregroundColor(.W50)
            Spacer()
        }
        .padding(.top, 12)
        .padding(.leading, 16)
    }
}
