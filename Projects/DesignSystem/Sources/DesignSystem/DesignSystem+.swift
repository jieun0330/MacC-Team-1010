//
//  DesignSystem+.swift
//  DesignSystem
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum DesignSystem {
	/// DesignSystem에서만 사용될 Constant
	public enum Constant {
		private static var bundleId: String { "com.teamten.julookdesignsystem" }
		public static var bundle: Bundle? { Bundle(identifier: bundleId) }
	}
}
