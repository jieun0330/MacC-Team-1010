//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/03.
//

import SwiftUI
import FeatureSearch
import FeatureAuth
import FeatureMain
import Utils
import FeatureInformation
import Core
import DesignSystem

public struct RootView: View {
	public init() {
		setCustomNavigationBar()
	}
	
	public var body: some View {
		NavigationStack {
			SearchView()
				.toolbar {
					ToolbarItem(placement: .navigationBarLeading) {
						Image(uiImage: .designSystem(.logo)!)
					}
					
					ToolbarItem(placement: .navigationBarTrailing) {
						Image(uiImage: .designSystem(.logo2)!)
					}
				}
		}
		
		//MARK: - version 2
		//		NavigationStack {
		//			if KeyChainManager.shared.read(account: .accessToken) == "" {
		//				AuthView()
		//			} else {
		//				SearchView()
		//					.toolbar {
		//						ToolbarItem(placement: .navigationBarLeading) {
		//							Image(uiImage: .designSystem(.logo)!)
		//						}
		//					}
		//			}
		//		}
		//		.onAppear {
		//			print(KeyChainManager.shared.read(account: .accessToken))
		//		}
	}
}
