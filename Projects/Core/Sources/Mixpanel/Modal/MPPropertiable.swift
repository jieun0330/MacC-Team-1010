//
//  MPPropertiable.swift
//  Core
//
//  Created by Eric Lee on 11/26/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation
import Mixpanel

protocol MPPropertiable {
	var mpProperty: String { get }
	var mpMixpanelType: String {get}
}
