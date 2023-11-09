//
//  AuthView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/12.
//

import SwiftUI
import FeatureHome
import Utils

public struct AuthView: View {
	@State private var keychainCreated = false
	
	public init() {}
	
	public var body: some View {
		Button {
			Task {
				try KeyChainManager.shared.create(account: .userId,
												  data: 0)
				keychainCreated = true
			}
		} label: {
			Text("Set Temp User Token")
				.foregroundColor(.black)
				.padding()
				.background {
					RoundedRectangle(cornerRadius: 10)
				}
		}
		.navigationDestination(isPresented: $keychainCreated) {
			HomeView()
				.navigationBarBackButtonHidden()
		}
	}
}
