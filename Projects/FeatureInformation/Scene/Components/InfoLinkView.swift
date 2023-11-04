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
	
	public let brewery: Brewery /// 양조장
	
	init(brewery: Brewery) {
		self.brewery = brewery
	}
	
	
	var body: some View {
		VStack(spacing: 0) {
			
			//Header
			HStack {
				Text("정보")
					.font(.style(.SF22B))
					.foregroundColor(Color(uiColor: .designSystem(.white)!))
				Spacer()

			}
			.padding(.top, 20)
			.padding(.bottom, 10)
			
			//양조장
			HStack(alignment: .center) {
				Text("양조장")
					.font(.style(.SF14R))
					.foregroundColor(Color(uiColor: .designSystem(.darkgrey)!))
				
				Spacer()
				
				if let url = brewery.url {
					
					Link(destination: URL(string: url)!, label: {
						Text(brewery.name)
							.font(.style(.SF14R))
							.foregroundColor(Color(uiColor: .designSystem(.primary)!))
					})
					
					
				} else {
					
					Text(brewery.name)
						.font(.style(.SF14R))
						.foregroundColor(Color(uiColor: .designSystem(.white)!))
					
				}
			}
			.padding(.vertical, 10)
			
			DividerView()
			
			//판매 링크
			if let url = brewery.salesURL {
				
				HStack(alignment: .center) {
					Text("판매 링크")
						.font(.style(.SF14R))
						.foregroundColor(Color(uiColor: .designSystem(.darkgrey)!))
					Spacer()
					
					Link(destination: URL(string: url)!, label: {
						Text("공식몰")
							.font(.style(.SF14R))
							.foregroundColor(Color(uiColor: .designSystem(.primary)!))
					})
				}
				.padding(.vertical, 10)
				
			}
			
		}
    }
}

struct InfoLinkView_Previews: PreviewProvider {
	static var previews: some View {
		InfoLinkView(brewery: Brewery.mockTenTen)
	}
}
