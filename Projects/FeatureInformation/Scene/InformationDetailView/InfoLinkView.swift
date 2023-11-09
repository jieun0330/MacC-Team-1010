//
//  InfoLinkView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 2023/11/01.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct InfoLinkView: View {
	
	let brewery: Brewery
	
	var body: some View {
		VStack(spacing: 0) {
			
			//Header
			HStack {
				Text("정보")
					.SF20B()
					.foregroundColor(Color(uiColor: .designSystem(.white)!))
				Spacer()
				
			}
			.padding(.vertical, 20)
			
			//양조장
			breweryView()
				.padding(.vertical, 10)
			
			//판매 링크
			if let stringURL = brewery.salesURL,
			   let url = URL(string: stringURL) {
				
				DividerView()
				
				salesView(url: url)
					.padding(.vertical, 10)
				
			}
		}
		.padding(.horizontal, 16)
		.padding(.bottom, 40)
	}
}

extension InfoLinkView {
	@ViewBuilder
	func breweryView() -> some View {
		HStack(alignment: .center) {
			Text("양조장")
				.SF14R()
				.foregroundColor(.W85)
			
			Spacer()
			
			if let stringURL = brewery.url,
			   let url = URL(string: stringURL) {
				
				Link(destination: url , label: {
					Text(brewery.name)
						.font(.style(.SF14R))
						.foregroundColor(.Primary)
				})
				
			} else {
				Text(brewery.name)
					.SF14R()
					.foregroundColor(.White)
				
			}
		}
	}
	
	func salesView(url: URL) -> some View {
		HStack(alignment: .center) {
			Text("판매 링크")
				.SF14R()
				.foregroundColor(.W85)
			Spacer()
			
			Link(destination: url, label: {
				Text("공식몰")
					.SF14R()
					.foregroundColor(.Primary)
			})
		}
	}
}
