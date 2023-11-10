//
//  CommentEditView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/08.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

struct CommentEditView: View {
    
    @Environment(\.presentationMode) var presentation
    @Binding var showModal: Bool
    @State private var commentBox: String = ""
    @State private var isSelected: Bool = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                TextField("막걸리에 대한 생각을 자유롭게 적어주세요.", text: $commentBox)
                    .frame(height: 300)
                    .padding()
                Spacer()
                Divider()
                HStack {
                    Spacer()
                    Text("비공개")
                        .SF14R()
                        .foregroundColor(.W50)
                    
                    Button {
                        self.isSelected.toggle()
                    } label: {
                        isSelected ? Image(uiImage: .designSystem(.isSelectedTrue)!) : Image(uiImage: .designSystem(.isSelectedFalse)!)
                    }
                }
                .padding()
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("취소", role: .cancel) {
                        showModal = false
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("코멘트 수정")
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("저장") {
                        showModal = false
                    }
                }
            }
        }
        .accentColor(.Primary)
    }
}
