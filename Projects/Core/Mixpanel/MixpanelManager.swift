//
//  MixpanelManager.swift
//  Core
//
//  Created by Eric Lee on 11/26/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation
import Mixpanel

final public class MixpanelManager {
	static public let shared = MixpanelManager()
	
	public func initMixpanel() {
		if let apiKey = Bundle.main.infoDictionary?["MIXPANEL_API_KEY"] as? String {
			Mixpanel.initialize(token: apiKey, trackAutomaticEvents: true)
		} else {
			print("Mixpanel API key not found")
		}
	}
}
