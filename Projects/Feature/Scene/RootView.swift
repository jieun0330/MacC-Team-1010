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
<<<<<<< HEAD
        
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
=======
		TabView {
			HomeView()
				.tabItem {
					Image(uiImage: .designSystem(.home)!)
					Text("홈")
						.font(.style(.SF10B))
				}
			SearchView()
				.tabItem {
					Image(uiImage: .designSystem(.search)!)
					Text("검색")
						.font(.style(.SF10B))
				}
			EncyclopediaView()
				.tabItem {
					Image(uiImage: .designSystem(.heart)!)
					Text("내 막걸리")
						.font(.style(.SF10B))
				}
			ProfileView()
				.tabItem {
					Image(uiImage: .designSystem(.person)!)
					Text("내 정보")
						.font(.style(.SF10B))
				}
		}
>>>>>>> 2091ac0 (:lipstick: [style] tab icon 세팅 #45)
	}
}
