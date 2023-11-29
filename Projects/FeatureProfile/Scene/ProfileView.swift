//
//  ProfileView.swift
//  FeatureProfile
//
//  Created by Kim SungHun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

public struct ProfileView: View {
	@StateObject var viewModel = ProfileViewModel(
		userRepository: DefaultUserRepository(),
		authRepository: DefaultAuthRepository(),
		accountRepository: DefaultAccountRepository()
	)
	
	public init() { }
	
	public var body: some View {
		NavigationStack {
			ScrollView(.vertical, showsIndicators: false) {
				MyInformationView(viewModel: viewModel)
				SettingListView(viewModel: viewModel)
			}
            .background(Color.DarkBase)
		}
	}
}
