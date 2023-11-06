//
//  MakgeolliAPI.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Moya

public enum MakgeolliAPI {
	case fetchMakgeolliList(parameters: [String: Any]?)
	case fetchMakgeolliInfo(parameter: [String: Any])
	case fetchMakgeolliLikesAndComments(parameter: [String: Any])
}

extension MakgeolliAPI: TargetType {
	public var baseURL: URL {
		return URL(string: "http://43.202.219.115:8080/api/v1/makInfo/userSearch")!
	}
	
	public var path: String {
		switch self {
		case .fetchMakgeolliList:
			return ""
		case .fetchMakgeolliInfo:
			return "/detail"
		case .fetchMakgeolliLikesAndComments:
			return "/makLikesAndComments"
		}
	}
	
	public var method: Moya.Method {
		return .get
	}
	
	public var task: Moya.Task {
		switch self {
		case .fetchMakgeolliList(parameters: .none):
			return .requestPlain
		case .fetchMakgeolliList(let parameter):
			return .requestParameters(parameters: parameter!, encoding: URLEncoding.queryString)
		case .fetchMakgeolliInfo(let parameter):
			return .requestParameters(parameters: parameter, encoding: URLEncoding.queryString)
		case .fetchMakgeolliLikesAndComments(let parameter):
			return .requestParameters(parameters: parameter, encoding: URLEncoding.queryString)
		}
	}
	
	public var headers: [String : String]? {
		return ["Content-Type": "application/json"]
	}
}

extension MakgeolliAPI {
	static public func request<T: Decodable>(target: MakgeolliAPI, dataType: T.Type) async throws -> T {
		return try await withCheckedThrowingContinuation { continuation in
			let provider = MoyaProvider<MakgeolliAPI>()
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
	
	static public func request(target: MakgeolliAPI) async throws -> Response {
		return try await withCheckedThrowingContinuation { continuation in
			let provider = MoyaProvider<MakgeolliAPI>(plugins: [MoyaCacheablePlugin()])
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
