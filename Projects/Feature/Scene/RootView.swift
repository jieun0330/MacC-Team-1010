//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/03.
//

import SwiftUI
import Core
import DesignSystem
import Utils
import FeatureEncyclopedia
import FeatureHome
import FeatureProfile
import FeatureSearch
import FeatureOnboarding

public struct RootView: View {
	public init() {
		setCustomNavigationBar()
	}
	
	private let randomNickname = ["걸쭉한라쿤", "상큼한라쿤", "달달한라쿤"]
	
	public var body: some View {
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
        
//		if KeyChainManager.shared.read(account: .userId).isEmpty {
//			OnboardingView(nickname: randomNickname.randomElement()!)
//		} else {
//			TabView {
//				HomeView()
//					.tabItem {
//						Image(uiImage: .designSystem(.home)!)
//						Text("홈")
//							.font(.style(.SF10B))
//					}
//				SearchView()
//					.tabItem {
//						Image(uiImage: .designSystem(.search)!)
//						Text("검색")
//							.font(.style(.SF10B))
//					}
//				TabMenuView()
//					.tabItem {
//						Image(uiImage: .designSystem(.heart)!)
//						Text("내 막걸리")
//							.font(.style(.SF10B))
//					}
//				ProfileView()
//					.tabItem {
//						Image(uiImage: .designSystem(.person)!)
//						Text("내 정보")
//							.font(.style(.SF10B))
//					}
//			}
//		}
	}
}
