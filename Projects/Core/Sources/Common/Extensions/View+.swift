//
//  View+.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/09.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

extension View {
	public func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
										to: nil, from: nil, for: nil)
	}
}
