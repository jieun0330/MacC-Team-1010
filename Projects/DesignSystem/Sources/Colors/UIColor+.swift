//
//  Color+extensions.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/03.
//

import UIKit

extension UIColor {
	public class func designSystem(_ color: TENTENColor) -> UIColor? {
		guard let bundle = DesignSystem.Constant.bundle else { return nil }
		return UIColor(named: color.name, in: bundle, compatibleWith: nil)
	}
}
