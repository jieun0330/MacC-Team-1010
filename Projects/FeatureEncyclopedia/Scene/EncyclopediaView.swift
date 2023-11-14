//
//  TabMenuView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

public struct EncyclopediaView: View {
    
    @State var index = 0
    @StateObject var viewModel = EncyclopediaViewModel(userRepository: DefaultUserRepository())
    
    private let titles = ["전체", "좋았어요", "아쉬워요", "찜", "코멘트"]
    
    public init() { }
    
    public var body: some View {
        NavigationStack {
            VStack {
                TabNameView()
                
                TabView(selection: $index) {
                    ForEach (0..<5) { pageId in
                        switch pageId {
                        case 0:
                            AllView(viewModel: viewModel)
                        case 1:
                            LikeView(viewModel: viewModel)
                        case 2:
                            DislikeView(viewModel: viewModel)
                        case 3:
                            BookmarkView(viewModel: viewModel)
                        default:
                            CommentView(viewModel: viewModel)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .onAppear {
                if !viewModel.fetchLoading {
                    viewModel.getUserMakFolder()
                }
            }
            .background(Color.DarkBase)
        }
    }
}

private extension EncyclopediaView {
    @ViewBuilder
    func TabNameView() -> some View {
        ScrollViewReader { proxy in
            
            HStack(spacing: 10) {
                
                ForEach(titles.indices, id: \.self) {id in
                    let title = Text(titles[id])
                        .SF14R()
                        .frame(width: 52)
                        .onTapGesture {
                            index = id
                        }
                    VStack {
                        Spacer()
                            .frame(height: 10)
                        title
                            .foregroundColor(self.index == id ? .White : .W85)
                        Capsule()
                            .frame(width: 68, height: 2)
                            .foregroundColor(self.index == id ? .Primary2 : .DarkBase)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color.DarkBase)
    }
}
