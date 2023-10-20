//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/03.
//

import SwiftUI
import FeatureMain
import FeatureAuth
import Utils
import FeatureInformation

public struct RootView: View {
	
	public init() {}
	
	public var body: some View {
		NavigationStack {
			if KeyChainManager.shared.read(account: .accessToken) == "" {
				AuthView()
			} else {
//				MainView()
                InformationView()
			}
		}
		.onAppear {
			print(KeyChainManager.shared.read(account: .accessToken))
		}
	}
}
