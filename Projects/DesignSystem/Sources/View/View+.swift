//
//  View+.swift
//  DesignSystem
//
//  Created by Eric Lee on 11/14/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

extension View {
	public func placeholder<Content: View>(
		when shouldShow: Bool,
		alignment: Alignment = .leading,
		@ViewBuilder placeholder: () -> Content) -> some View {

		ZStack(alignment: alignment) {
			placeholder().opacity(shouldShow ? 1 : 0)
			self
		}
	}
}
