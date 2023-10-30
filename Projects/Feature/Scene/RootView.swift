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
			NavigationStack {
				HomeView()
					.tabItem {
						Image(systemName: "house.fill")
						Text("홈")
					}
			}
			NavigationStack {
				SearchView()
					.tabItem {
						Image(systemName: "magnifyingglass")
						Text("검색")
					}
			}
			NavigationStack {
				EncyclopediaView()
					.tabItem {
						Image(systemName: "menucard.fill")
						Text("내 막걸리")
					}
			}
			NavigationStack {
				ProfileView()
					.tabItem {
						Image(systemName: "person.fill")
						Text("내 정보")
					}
			}
		}
	}
}
