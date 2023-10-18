//
//  UIImage+extensions.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/03.
//

import UIKit

extension UIImage {
	/// DesignSystem의 에셋
	/// - Parameter name: 사용할 에셋의 name
	public class func designSystem(_ name: TENTENAsset.name) -> UIImage? {
		UIImage(named: name.description, in: DesignSystem.Constant.bundle, with: nil)
	}
}
