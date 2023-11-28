//
//  AccountAPI.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation
import Moya

public enum AccountAPI {
	case modifyUserNickname(parameter: ModifyNicknameRequest)
	case deleteUserAccount(parameter: DeleteUserRequest)
	case dataLinking(parameter: DataLinkingRequest)
	case findMatchAccount(parameter: FindMatchAccountRequest)
}

extension AccountAPI: TargetType {
	public var baseURL: URL {
		if let url = Bundle.main.infoDictionary?["ACCOUNT_API_URL"] as? String {
			return URL(string: url)!
		}
		return URL(string: "")!
	}
	
	public var path: String {
		switch self {
		case .modifyUserNickname:
			return "/modifyUserNickname"
		case .deleteUserAccount:
			return "/deleteUserAccount"
		case .dataLinking:
			return "/dataLinking"
		case .findMatchAccount:
			return "/findMatchAccount"
		}
	}
	
	public var method: Moya.Method {
		return .post
	}
	
	public var task: Moya.Task {
		switch self {
		case .modifyUserNickname(parameter: let parameter):
			return .requestJSONEncodable(parameter)
		case .deleteUserAccount(parameter: let parameter):
			return .requestJSONEncodable(parameter)
		case .dataLinking(parameter: let parameter):
			return .requestJSONEncodable(parameter)
		case .findMatchAccount(parameter: let parameter):
			return .requestJSONEncodable(parameter)
		}
	}
	
	public var headers: [String : String]? {
		return ["Content-Type": "application/json"]
	}
}

extension AccountAPI {
	static public func request<T: Decodable>(target: AccountAPI, dataType: T.Type) async throws -> T {
		return try await withCheckedThrowingContinuation { continuation in
			let provider = MoyaProvider<AccountAPI>()
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
	
	static public func request(target: AccountAPI) async throws -> Response {
		return try await withCheckedThrowingContinuation { continuation in
			let provider = MoyaProvider<AccountAPI>(plugins: [MoyaCacheablePlugin()])
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
