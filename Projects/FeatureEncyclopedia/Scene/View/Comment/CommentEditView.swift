//
//  CommentEditView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/08.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

struct CommentEditView: View {
    
    @ObservedObject var viewModel: EncyclopediaViewModel
    var mak: GetUserMakFolderContent
    @Environment(\.presentationMode) var presentation
    @Binding var showModal: Bool
    @State var isSecretSelected: Bool = false
    var initialComment: String
    @State private var commentBox: String
    @FocusState private var focusField: Field?
    
    enum Field: Hashable {
        case text
    }
    
    init(showModal: Binding<Bool>, initialComment: String, viewModel: EncyclopediaViewModel, mak: GetUserMakFolderContent) {
        _showModal = showModal
        self.initialComment = initialComment
        self._commentBox = State(initialValue: initialComment)
        self.viewModel = viewModel
        self.mak = mak
    }
    
    var body: some View {
        
        HStack {
            Button(action: {
                showModal = false }) {
                    Text("취소").SF17B()
                }
                .accentColor(.Primary)
            Spacer()
            Text("코멘트 수정")
                .SF17B()
            Spacer()
            Button(action: {
                viewModel.updateComment(makSeq: mak.makSeq!, contents: commentBox, isVisible: isSecretSelected ? "N" : "Y")
                showModal = false
            }) {
                Text("저장").SF17B()
            }
            .accentColor(.Primary)
        }
        .padding()
        
        VStack {
            Section {
                TextField("막걸리에 대한 생각을 자유롭게 적어주세요.", text: $commentBox, axis: .vertical)
                    .padding()
                    .focused($focusField, equals: .text)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        focusField = .text
                    }
            }
            Spacer()
            Divider()
            HStack {
                Spacer()
                Text("비공개")
                    .SF14R()
                    .foregroundColor(.W50)
                Button {
                    self.isSecretSelected.toggle()
                } label: {
                    isSecretSelected ? Image(uiImage: .designSystem(.isSelectedTrue)!) : Image(uiImage: .designSystem(.isSelectedFalse)!)
                }
            }
            .padding()
            Spacer()
        }
    }
}
