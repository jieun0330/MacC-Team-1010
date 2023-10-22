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
import Common

public struct RootView: View {
	public init() {
		setCustomNavigationBar()
	}
	
	public var body: some View {
		NavigationStack {
			if KeyChainManager.shared.read(account: .accessToken) == "" {
				AuthView()
			} else {
				SearchView()
			}
		}
		.onAppear {
			print(KeyChainManager.shared.read(account: .accessToken))
		}
	}
}
