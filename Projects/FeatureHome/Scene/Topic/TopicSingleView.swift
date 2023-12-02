//
//  TopicSingleView.swift
//  FeatureHome
//
//  Created by Kim SungHun on 12/2/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import Core

struct TopicSingleView: View {
	let topic: TopicType
	
    var body: some View {
		RoundedRectangle(cornerRadius: 18)
			.fill(topic.topicColor)
			.frame(width: 160, height: 100)
			.overlay {
				HStack {
					VStack(spacing: 0) {
						Spacer()
						Text(topic.description)
							.SF12B()
							.multilineTextAlignment(.leading)
							.foregroundColor(.White)
							.padding(.leading, 16)
							.padding(.bottom, 16)
					}
					Spacer()
					VStack(spacing: 0) {
						Image(uiImage: topic.topicImage)
							.resizable()
							.frame(width: 48, height: 48)
							.padding(.trailing, 16)
							.padding(.top, 16)
						Spacer()
					}
				}
			}
    }
}
