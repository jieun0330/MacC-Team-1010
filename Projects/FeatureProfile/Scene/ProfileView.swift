//
//  ProfileView.swift
//  FeatureProfile
//
//  Created by Kim SungHun on 2023/10/30.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct ProfileView: View {
	public init() { }
	
	public var body: some View {
		NavigationStack {
			ScrollView(.vertical, showsIndicators: false) {
				MyInformationView()
				SettingListView()
			}
		}
	}
}

struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileView()
	}
}
