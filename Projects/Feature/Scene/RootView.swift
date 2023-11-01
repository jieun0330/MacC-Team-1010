//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/03.
//

import SwiftUI
import Core
import DesignSystem
import FeatureEncyclopedia
import FeatureHome
import FeatureProfile
import FeatureSearch

public struct RootView: View {
	public init() {
		setCustomNavigationBar()
	}
	
	public var body: some View {
		TabView {
			HomeView()
				.tabItem {
					Image(systemName: "house.fill")
					Text("홈")
				}
			SearchView()
				.tabItem {
					Image(systemName: "magnifyingglass")
					Text("검색")
				}
            TabMenuView()
				.tabItem {
					Image(systemName: "menucard.fill")
					Text("내 막걸리")
				}
			ProfileView()
				.tabItem {
					Image(systemName: "person.fill")
					Text("내 정보")
				}
		}
	}
}
