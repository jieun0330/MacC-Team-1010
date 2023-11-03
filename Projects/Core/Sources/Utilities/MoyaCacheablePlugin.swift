//
//  MoyaCacheablePlugin.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Moya

protocol MoyaCacheable {
	typealias MoyaCacheablePolicy = URLRequest.CachePolicy
	var cachePolicy: MoyaCacheablePolicy { get }
}

final class MoyaCacheablePlugin: PluginType {
	func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
		if let moyaCachableProtocol = target as? MoyaCacheable {
			var cachableRequest = request
			cachableRequest.cachePolicy = moyaCachableProtocol.cachePolicy
			return cachableRequest
		}
		return request
	}
}
