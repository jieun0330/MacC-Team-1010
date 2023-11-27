//
//  SkipGenderAndBirthView.swift
//  FeatureOnboarding
//
//  Created by Kim SungHun on 2023/11/26.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import Combine
import DesignSystem

public struct SkipGenderAndBirthView: View {
	@State var genderSelected: Int?
	@State private var selected = [false, false, false]
	@State private var showAlert = false
	@State private var birthDay = ""
	
	let genders = ["남성", "여성", "기타"]
	
	public init() { }
	
	public var body: some View {
		VStack(alignment: .center, spacing: 0) {
			Spacer()
			
			HStack(spacing: 0) {
				Text("성별, 출생연도")
					.foregroundColor(.Primary)
					.SF24B()
				Text("를 알려주세요")
					.SF24B()
			}
			.padding(.bottom, 8)
			
			Text("막걸리 추천이 더 정확해져요!")
				.SF14R()
				.foregroundColor(.W50)
				.padding(.bottom, 24)
			
			HStack(spacing: 8) {
				ForEach(0..<3) { button in
					Button(action: {
						self.selected = self.selected.enumerated().map { $0.offset == button }
					}, label: {
						ZStack {
							Rectangle()
								.cornerRadius(12)
								.frame(width: 94, height: 58)
								.foregroundColor(self.selected[button] ? Color.Lilac : Color.DarkBase)
								.overlay(
									RoundedRectangle(cornerRadius: 12)
										.stroke(Color.Lilac, lineWidth: 3)
								)
							Text(self.genders[button])
								.SF20B()
								.foregroundColor(Color.White)
						}
					})
				}
			}
			.padding(.bottom, 24)
			
			TextField("1997", text: $birthDay)
				.frame(width: 200)
				.textFieldStyle(BirthDayTextFieldStyle())
				.keyboardType(.numberPad)
				.onReceive(Just(birthDay)) { newValue in
					let filtered = newValue.filter { "0123456789".contains($0) }
					if filtered != newValue {
						self.birthDay = filtered
					}
					if self.birthDay.count == 5 {
						self.birthDay.removeLast()
					}
				}
				.padding(.bottom, 24)
			
			Spacer()
			
			nextButton()
		}
		.toolbarBackground(Color(uiColor: .designSystem(.darkbase)!), for: .navigationBar)
		.navigationBarBackButtonHidden()
		.background(Color(uiColor: .designSystem(.darkbase)!))
	}
}

private extension SkipGenderAndBirthView {
	@ViewBuilder
	func nextButton() -> some View {
		NavigationLink {
			// skip user api set 하고 나서
			// 메인으로 full modal
		} label: {
			RoundedRectangle(cornerRadius: 12)
				.fill(
					Color(uiColor: .designSystem(selected.contains(true) && birthDay.count == 4 ? .goldenyellow : .w10)!)
				)
				.frame(height: 50)
				.overlay {
					Text("완료")
						.foregroundColor(selected.contains(true) && birthDay.count == 4 ? .White : .W25)
						.SF17R()
				}
				.padding(.bottom, 16)
				.padding(.horizontal, 16)
		}
		.disabled(!selected.contains(true) || birthDay.count != 4)
	}
	
	struct BirthDayTextFieldStyle: TextFieldStyle {
		func _body(configuration: TextField<Self._Label>) -> some View {
			ZStack {
				Rectangle()
					.cornerRadius(12)
					.frame(width: 300, height: 58)
					.foregroundColor(.DarkBase)
					.overlay(
						RoundedRectangle(cornerRadius: 12)
							.stroke(Color.Lilac, lineWidth: 3)
					)
				configuration
					.font(.style(.SF24B))
					.kerning(3)
					.multilineTextAlignment(.center)
					.padding()
			}
		}
	}
}
