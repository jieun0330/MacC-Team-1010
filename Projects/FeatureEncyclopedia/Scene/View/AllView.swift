//
//  AllView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//


import SwiftUI
import Core
import FeatureInformation

enum EncyclopediaType {
    case all
    case like
    case dislike
    case bookmark
    case comment
}

struct AllView: View {
    @StateObject var viewModel = EncyclopediaViewModel(userRepository: DefaultUserRepository())
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    private let type = EncyclopediaType.all
    private let drink = User.user1.likes + User.user1.dislikes
    
    public var body: some View {
        if viewModel.fetchLoading {
            ProgressView()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .foregroundColor(Color(uiColor: .designSystem(.white)!))
                .background(Color.DarkBase)
                .alert(isPresented: $viewModel.errorState) {
                    Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
                          dismissButton: .default(Text("확인")))
                }
                .onAppear {
                    viewModel.getUserMakFolder()
                }
        } else {
            if viewModel.makModel.isEmpty {
                VStack(spacing: 20) {
                    Spacer()
                    Text("비어있어요..")
                        .SF17R()
                        .foregroundColor(.W50)
                    Image(uiImage: .designSystem(.character)!)
                    Spacer()
                }
            } else {
                ScrollView(showsIndicators: false) {
                    HStack {
                        Text("300개 중 \((viewModel.makModel.filter { $0.reactionLike == "LIKE" } + viewModel.makModel.filter { $0.reactionLike == "DISLIKE" }).count)개를 마셔봤어요!")
                            .SF12R()
                            .foregroundColor(.W50)
                        Spacer()
                    }
                    .padding(.top, 12)
                    .padding(.leading, 16)
                    
                    // LazyVGrid spacing은 위아래 간격
                    LazyVGrid(columns: columns, spacing: 16, content: {
                        ForEach(viewModel.makModel, id: \.self) { mak in
                            Button {
                                if let id = mak.makSeq {
                                    viewModel.resultMakHolyId = id
                                }
                            } label: {
                                ThumbnailView(mak: mak, type: .all)
                                    .onAppear {
                                        if mak == viewModel.makModel.last {
                                            if !viewModel.isLastPage {
                                                var offset = viewModel.currentOffset
                                                offset += 1
                                                withAnimation {
                                                    viewModel.nextGetUserMakFolder(offset: offset)
                                                }
                                            }
                                        }
                                    }
                            }
                        }
                        .padding(.trailing, 16)
                    })
                    // 썸네일 전체 뷰의 패딩
                    .padding(.bottom)
                    .padding(.leading, 16)
                }
                .fullScreenCover(item: $viewModel.resultMakHolyId) { makHolyId in
                    InformationView(makHolyId: makHolyId)
                }
            }
        }
    }
}
