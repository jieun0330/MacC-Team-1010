//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/06.
//

import SwiftUI
import Core
import DesignSystem

public struct HomeView: View {
	public init() {}
	
	public var body: some View {
		NavigationStack {
			ScrollView(showsIndicators: false) {
				VStack {
					GeometryReader { proxy in
						let global = proxy.frame(in: .global)
						LinearGradient(
							stops: [
								Gradient.Stop(color: Color(red: 0.18, green: 0.18, blue: 0.39),
											  location: 0.00),
								Gradient.Stop(color: Color(red: 0.4, green: 0.33, blue: 0.13),
											  location: 1.00),
							],
							startPoint: UnitPoint(x: 0.5, y: 0),
							endPoint: UnitPoint(x: 0.5, y: 1)
						)
						// image로 변경 시 resizable 추가해야함
						.offset(y: global.minY > 0 ? -global.minY : 0)
						.frame(
							height: global.minY > 0 ?
							(UIScreen.main.bounds.height/2.5) + global.minY
							: UIScreen.main.bounds.height/2.5
						)
					}
					.frame(height: UIScreen.main.bounds.height / 2.5)
					.padding(.bottom, 20)
					
					CharacteristicsView()
					
					Divider()
						.background(Color(uiColor: .designSystem(.w25)!))
						.frame(height: 0.33)
						.padding(.top, 10)
						.padding(.leading, 20)
						.padding(.bottom, 20)
					
					NewItemView()
					
					Divider()
						.background(Color(uiColor: .designSystem(.w25)!))
						.frame(height: 0.33)
						.padding(.top, 10)
						.padding(.leading, 20)
						.padding(.bottom, 20)
					
					LatestCommentView()
				}
				//			VStack(spacing: 0) {
				//				Spacer()
				//					.frame(height: 12)
				//
				//				CharacteristicsView()
				//
				//				Divider()
				//					.frame(height: 1)
				//					.padding(.vertical, 20)
				//
				//				RegionView()
				//
				//				Divider()
				//					.frame(height: 1)
				//					.padding(.vertical, 20)
				//
				//				PriceView()
				//
				//				Spacer()
				//			}
			}
			.ignoresSafeArea(.all, edges: .top)
		}
	}
}
