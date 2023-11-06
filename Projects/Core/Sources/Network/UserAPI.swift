//
//  AuthAPI.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/06.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Moya

public enum UserAPI {
	case skipSignin(parameter: UserRequest)
	case updateComment(parameter: CommentRequest)
}

extension UserAPI: TargetType {
	public var baseURL: URL {
		return URL(string: "http://43.202.219.115:8080/api/v1/user")!
	}
	
	public var path: String {
		switch self {
		case .skipSignin:
			return "/SkipSignIn"
		case .updateComment:
			return "/updateComment"
		}
	}
	
	public var method: Moya.Method {
		.post
	}
	
	public var task: Moya.Task {
		switch self {
		case .skipSignin(let parameter):
			return .requestJSONEncodable(parameter)
		case .updateComment(let parameter):
			return .requestJSONEncodable(parameter)
		}
	}
	
	public var headers: [String : String]? {
		return ["Content-Type": "application/json"]
	}
}

extension UserAPI {
	static public func request<T: Decodable>(target: UserAPI, dataType: T.Type) async throws -> T {
		return try await withCheckedThrowingContinuation { continuation in
			let provider = MoyaProvider<UserAPI>()
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
	
	static public func request(target: UserAPI) async throws -> Response {
		return try await withCheckedThrowingContinuation { continuation in
			let provider = MoyaProvider<UserAPI>(plugins: [MoyaCacheablePlugin()])
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
