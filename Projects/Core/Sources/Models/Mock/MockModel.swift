//
//  MockModel.swift
//  Core
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import DesignSystem

public enum MockTaste {
	case sweet
	case bitter
	case refreshing
	case mild
	
	public var description: String {
		switch self {
		case .sweet:
			return "단맛"
			
		case .bitter:
			return "쓴맛"
			
		case .refreshing:
			return "청량감"
			
		case .mild:
			return "걸쭉함"
		}
	}
}

public struct MockMakgeolliModel: Hashable {
	public var imageName: TENTENAsset.name = .mockImage
	public var breweryName: String = "양조장 이름" ///양조장 이름
	public var name: String = "막걸리 이름" /// 막걸리 이름
	public var alcoholContent: Double = 16.0 /// 도수
	public var capacity: Int = 750 /// 용량
	public var price: Int = 150000 /// 가격
	public var taste: [MockTaste] = [.sweet, .bitter, .refreshing, .mild] /// 맛에 대한 설명 배열
	public var tasteScore: [Int] = [0, 0, 0, 0] /// 맛에 대한 점수 배열
	public var info: String = "막걸리 정보" /// 정보
	public var awards: [String] = ["2023 대상"] /// 수상 정보 배열
	public var ingredients: [String] = ["쌀", "물"] /// 원재료 배열
	public var breweryInfo: String = "양조장 정보" /// 양조장 정보
	public var recommendedFood: [String] = ["생선 요리", "족발"] /// 어울리는 음식 배열
	public var website: String = "https://www.example.com" /// 홈페이지 URL
}
