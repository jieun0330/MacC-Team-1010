//
//  HomeAPI.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Moya

public enum HomeAPI {
	case recentComments
	case newMakList
}

extension HomeAPI: TargetType {
	public var baseURL: URL {
		return URL(string: "http://43.202.219.115:8080/api/v1/home")!
	}
	
	public var path: String {
		switch self {
		case .recentComments:
			return "/recentComments"
		case .newMakList:
			return "/newMakList"
		}
	}
	
	public var method: Moya.Method {
		return .get
	}
	
	public var task: Moya.Task {
		return .requestPlain
	}
	
	public var headers: [String : String]? {
		return ["Content-Type": "application/json"]
	}
}

extension HomeAPI {
	static public func request<T: Decodable>(target: HomeAPI, dataType: T.Type) async throws -> T {
		return try await withCheckedThrowingContinuation { continuation in
			let provider = MoyaProvider<HomeAPI>()
			provider.request(target) { result in
				switch result {
				case .success(let response):
					print("request 1 didFinishRequest URL [\(response.request?.url?.absoluteString ?? "")]")
					do {
						let data = try JSONDecoder().decode(T.self, from: response.data)
						continuation.resume(returning: data)
					} catch {
						continuation.resume(throwing: error)
					}
				case .failure(let error):
					continuation.resume(throwing: error)
				}
			}
		}
	}
	
	static public func request(target: HomeAPI) async throws -> Response {
		return try await withCheckedThrowingContinuation { continuation in
			let provider = MoyaProvider<HomeAPI>(plugins: [MoyaCacheablePlugin()])
			provider.request(target) { result in
				switch result {
				case .success(let response):
					print("request 2 didFinishRequest URL [\(response.request?.url?.absoluteString ?? "")]")
					continuation.resume(returning: response)
				case .failure(let error):
					continuation.resume(throwing: error)
				}
			}
		}
	}
}
