//
//  CommentEditView.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/08.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import Combine

struct CommentEditView: View {
	@ObservedObject var viewModel: EncyclopediaViewModel
	
	@Environment(\.presentationMode) var presentation
	
	@State var isSecretSelected: Bool
	@State private var commentBox: String
	@FocusState private var focusField: Field?
	@Binding var showModal: Bool
	
	let textLimit = 250
	
	var mak: GetUserMakFolderContent
	var initialComment: String
	
	enum Field: Hashable {
		case text
	}
	
	init(showModal: Binding<Bool>,
		 initialComment: String,
		 viewModel: EncyclopediaViewModel,
		 mak: GetUserMakFolderContent,
		 isSecretSelected: Bool) {
		_showModal = showModal
		self.initialComment = initialComment
		self._commentBox = State(initialValue: initialComment)
		self.viewModel = viewModel
		self.mak = mak
		self._isSecretSelected = State(initialValue: isSecretSelected)
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
				if commentBox.isEmpty {
					
				} else {
					viewModel.updateComment(makSeq: mak.makSeq!,
											contents: commentBox,
											isVisible: isSecretSelected ? "N" : "Y")
					showModal = false
				}
			}) {
				Text("저장").SF17B()
			}
			.accentColor(.Primary)
		}
		.padding()
		
		VStack {
			VStack(alignment: .leading) {
				Section {
					TextField("막걸리에 대한 생각을 자유롭게 적어주세요.", text: $commentBox, axis: .vertical)
						.onReceive(Just(commentBox)) { _ in limitText(textLimit) }
						.padding()
						.focused($focusField, equals: .text)
						.contentShape(Rectangle())
						.onTapGesture {
							focusField = .text
						}
				}
			}
			.frame(height: 300)
			
			Divider()
			HStack {
				Spacer()
				Text("비공개")
					.SF14R()
					.foregroundColor(.W50)
				Button {
					self.isSecretSelected.toggle()
				} label: {
					isSecretSelected ? Image(uiImage: .designSystem(.isSelectedTrue)!) :
					Image(uiImage: .designSystem(.isSelectedFalse)!)
				}
			}
			.padding()
			Spacer()
		}
		.alert(isPresented: $viewModel.errorState) {
			Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
				  dismissButton: .default(Text("확인")))
		}
	}
	
	func limitText(_ upper: Int) {
		if commentBox.count > upper {
			commentBox = String(commentBox.prefix(upper))
		}
	}
}
