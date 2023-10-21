//
//  MockData.swift
//  Core
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import DesignSystem

public class MockData {
	public init() { }
	
	/// 느린마을  막걸리 10개
	public static func createNormalMockMakgeolli() -> [MockMakgeolliModel] {
		var mockMakgeolliArray = [MockMakgeolliModel]()
		for _ in 0..<10 {
			mockMakgeolliArray.append(MockMakgeolliModel())
		}
		return mockMakgeolliArray
	}
	
	/// 내부 쇼케이스 용 10개 데이터
	public static func createMockMakgeolli() -> [MockMakgeolliModel] {
		var mockMakgeolliArray = [MockMakgeolliModel]()
		mockMakgeolliArray.append(MockMakgeolliModel(
			imageName: .haechang12,
			breweryName: "해창주조장",
			name: "해창 생막걸리",
			alcoholContent: 12.0,
			capacity: 900,
			price: 12000,
			taste: [.sweet, .bitter, .refreshing, .mild],
			tasteScore: [4, 2, 2, 5],
			info: "땅끝마을 해남에서 온 프리미엄 생 막걸리 찹쌀과 멥쌀 그리고 물,원재료의 고요한 맛과 향을 그대로 담아 자연 발효로 장기간 숙성시켜 만듭니다.",
			awards: [],
			ingredients: ["정제수", "참쌀(국내산)15.3%", "멥쌀(국내산)", "입국", "곡자(밀)", "밀합유", "효모"],
			breweryInfo: "해창주조장",
			recommendedFood: ["전복구이", "홍어무침", "김치찜", "빈대떡"],
			website: "https://haechangjujo.modoo.at/"
		))
		
		mockMakgeolliArray.append(MockMakgeolliModel(
			imageName: .haechang9,
			breweryName: "해창주조장",
			name: "해창 막걸리 9도",
			alcoholContent: 9.0,
			capacity: 900,
			price: 8000,
			taste: [.sweet, .bitter, .refreshing, .mild],
			tasteScore: [1, 1, 2, 4],
			info: "땅끝 해남의 청정 자연 발효환경에서 생산된 프리미엄 무감미료 생막걸리이다. 국내산 100% 멥쌀과 찹쌀에서 나오는 인위적이지 않은 단맛이 매력적이다. 물이 적게 들어가 원재료의 맛이 살아있으며, 은은한 단향과 과실향이 난다. 찹쌀의 감칠맛과 멥쌀의 센맛이 자연스럽게 어우러져 묵직하고 바디감이 있다.",
			awards: [],
			ingredients: ["햅쌀", "찹쌀", "물", "누룩"],
			breweryInfo: "해창주조장",
			recommendedFood: ["전복구이"],
			website: "https://haechangjujo.modoo.at/"
		))
		
		mockMakgeolliArray.append(MockMakgeolliModel(
			imageName: .bokson,
			breweryName: "복순도가",
			name: "복순도가 손막걸리",
			alcoholContent: 6.5,
			capacity: 935,
			price: 12000,
			taste: [.sweet, .bitter, .refreshing, .mild],
			tasteScore: [2, 3, 5, 4],
			info: "손으로 직접 빚은 순수 생막걸리, 복순도가 손막걸리는 전통 방식으로 빚은 가양주 형식의 전통주로써, 비옥한 토양에서 자란 국내산 쌀만을 사용, 옛 항아리에 담아 정성스레 빚은 천연 탄산 막걸리이다. 특히, 복순도가 손막걸리는 샴페인이 연상될 만큼 탄산이 매우 풍부하다.",
			awards: ["2015년 샌프란시스코 국제 와인 주류 품평회 (금상)", "2018년 K-DESIGN AWARD"],
			ingredients: ["정제수", "쌀(국산)", "곡자(밀)", "물엿", "설탕", "아스파탐(감미료,페닐알라닌함유)"],
			breweryInfo: "복순도가",
			recommendedFood: ["파전", "치킨", "보쌈", "족발", "해산물"],
			website: "http://www.boksoon.com/"
		))
		
		mockMakgeolliArray.append(MockMakgeolliModel(
			imageName: .neulinmaeul,
			breweryName: "배상면주가",
			name: "느린마을 막걸리",
			alcoholContent: 6,
			capacity: 750,
			price: 3600,
			taste: [.sweet, .bitter, .refreshing, .mild],
			tasteScore: [3, 2, 2, 4],
			info: "느린 마을 막걸리는 계절마다 맛이 약간씩 다르다. 쌀과 물, 누룩만을 이용해서 빚는 술이기 때문에 계절에 따라 온도와 습도 등 계절마다 다른 숙성 환경이 그 이유인데, 일체 다른 인공감미료를 넣지 않아 만들어 원재료 그대로의 맛을 느낄 수 있는 막걸리다. 여름에 잘 익은 과일향이 올라오고 독특한 단맛을 가지고 있는 것이 특징이며, 입 안에 연하게 남는 쓴맛이 음식과의 조화를 잘 이룬다.",
			awards: ["2014 대한민국 우리술품평회 생막걸리 우수상", "2017 대한민국 우리술품평회 탁주 최우수상"],
			ingredients: ["쌀", "국", "효모", "정제수"],
			breweryInfo: "배상면주가",
			recommendedFood: [],
			website: "https://www.soolsool.co.kr/"
		))
		
		mockMakgeolliArray.append(MockMakgeolliModel(
			imageName: .palpal,
			breweryName: "팔팔양조장",
			name: "팔팔막걸리",
			alcoholContent: 6,
			capacity: 750,
			price: 4950,
			taste: [.sweet, .bitter, .refreshing, .mild],
			tasteScore: [3, 3, 2, 2],
			info: "팔팔막걸리는 특 등급의 김포금쌀만을 사용해서 빚으며 감미료 없이 만들어졌다. 발효곡주 고유의 부드러움, 은은한 단맛, 산미가 어우러져 시트러스 계열의 과일향이 난다. 마시고 난 뒤 입안에 남지 않는 깔끔한 피니쉬가 가장 큰 매력이다. 1~3주 차에는 탄산이 없으며 맛의 부드러움이 깊어진다.",
			awards: [],
			ingredients: ["정제수", "쌀(김포산, 김포금쌀)", "국", "산도조절제", "효모", "밀함유"],
			breweryInfo: "팔팔양조장",
			recommendedFood: ["살라미 크래커", "제육볶음", "두루치기"],
			website: "https://smartstore.naver.com/88yangjojang"
		))
		
		mockMakgeolliArray.append(MockMakgeolliModel(
			imageName: .nalu6,
			breweryName: "한강주조",
			name: "나루 생 막걸리 6도",
			alcoholContent: 6,
			capacity: 935,
			price: 7000,
			taste: [.sweet, .bitter, .refreshing, .mild],
			tasteScore: [3, 3, 2, 2],
			info: "원재료인 쌀 본연의 맛을 살려 깔금하게 넘어가는 목넘김이 좋은 인공 감미료 및 천연감미료 무첨가 막걸리다. 시간의 지남에 따라 주차별로 맛이 달라져 취향에 맞게 즐기기 좋다.",
			awards: [],
			ingredients: ["정제수", "쌀(국내산)", "국", "효모(밀함유)"],
			breweryInfo: "한강주조",
			recommendedFood: ["매콤한 쭈꾸미", "볶음류"],
			website: "https://hangangbrewery.com/"
		))
		
		mockMakgeolliArray.append(MockMakgeolliModel(
			imageName: .nalu11,
			breweryName: "한강주조",
			name: "나루 생 막걸리 11.5도",
			alcoholContent: 11.5,
			capacity: 500,
			price: 11000,
			taste: [.sweet, .bitter, .refreshing, .mild],
			tasteScore: [4, 1, 1, 5],
			info: "높은 쌀 함유량으로 원재료인 쌀 본연의 단맛을 살려 깔끔한 목넘김을 가지고 있다. 묵직한 텍스처, 청사과와 배의 향이 나며 시트러스 계열의 여운이 깊게 남는다. 무더운 여름, 얼음을 곁들여 온더락으로 마시기 좋은 막걸리다.",
			awards: [],
			ingredients: ["정제수", "쌀(국내산)", "국", "효모(밀함유)"],
			breweryInfo: "한강주조",
			recommendedFood: ["매콤한 쭈꾸미", "볶음류"],
			website: "https://hangangbrewery.com/"
		))
		
		mockMakgeolliArray.append(MockMakgeolliModel(
			imageName: .yusangyun,
			breweryName: "국순당",
			name: "1000억 유산균 막걸리",
			alcoholContent: 5,
			capacity: 750,
			price: 3200,
			taste: [.sweet, .bitter, .refreshing, .mild],
			tasteScore: [3, 5, 5, 3],
			info: "1000억 유산균 막걸리는 국순당이 최초로 선보인 유산균 강화 막걸리다. 식물성 유산균이 막걸리 한 병(750mL)에 1000억 마리 이상이 들어 있다. 시중에 판매되는 일반 생막걸리 한 병(자사 생막걸리 750mL 기준)당 1억 마리 가량의 유산균이 들어 있는 것과 비교하면 약 1000배 많이 들어있고, 일반 유산균음료 보다 약 100배 많이 들어 있다.",
			awards: ["2021 대한민국 주류대상우리술 탁주 생막걸리 부문 3년 연속 대상"],
			ingredients: ["국내산쌀", "누룩"],
			breweryInfo: "국순당",
			recommendedFood: ["전", "회무침"],
			website: "http://drink.ksdb.co.kr/"
		))
		
		mockMakgeolliArray.append(MockMakgeolliModel(
			imageName: .markholy,
			breweryName: "어메이징브루잉컴퍼니",
			name: "마크홀리 오리지널 6.0",
			alcoholContent: 6,
			capacity: 650,
			price: 7900,
			taste: [.sweet, .bitter, .refreshing, .mild],
			tasteScore: [3, 2, 1, 3],
			info: "마크홀리 오리지널 6.0은 누룩을 쓰지 않고 만든 것이 특징으로 낮은 단백질 함량 뿐만 아니라 은은한 쌀 향을 가지고 있다. 막걸리 특유의 탁한 맛을 줄이고 맥주 효모와 쌀만으로 만들어져 이것은 막걸리인가? 맥주인가? 싶을 정도로 가볍고 깔끔한 바디감을 가진 것이 특징이다.",
			awards: [],
			ingredients: ["정제수", "살(김포산)", "국", "산도조절제", "효모"],
			breweryInfo: "어메이징브루잉컴퍼니",
			recommendedFood: ["파전"],
			website: "https://www.amazingbrewing.co.kr/"
		))
		
		mockMakgeolliArray.append(MockMakgeolliModel(
			imageName: .damun,
			breweryName: "1932포천일동막걸리",
			name: "담은",
			alcoholContent: 6.5,
			capacity: 750,
			price: 11000,
			taste: [.sweet, .bitter, .refreshing, .mild],
			tasteScore: [4, 2, 1, 2],
			info: "경기도 포천시 최고급 쌀을 주원료로 사용하였으며 전통누룩에서 뽑아낸 우수한 균주를 사용하였다. 합성인공감미료를 전혀 사용하지 않은 제품으로 미생물 조절 발효 방식으로 냉장보관을 하여 개봉 후 뚜껑을 다시 닫아 냉장보관하여도 술맛에 변화가 없다. 1932 포천일동막걸리의 프리미엄 막걸리 제품이다. 아무것도 섞이지 않은 하얀색을 보고 있자니 포근한 느낌이 든다. 백설기에서 느낄 수 있는 단향이 올라온다. 가벼운 질감에 다 먹고 난 옥수수대를 쪽 빨았을 때 느껴지는 단맛이 있다.",
			awards: ["2016 대한민국 우리술품평회 장려상"],
			ingredients: ["쌀(국내산)", "입국", "효모", "고과당", "정제효소제", "정제수"],
			breweryInfo: "1932포천일동막걸리",
			recommendedFood: ["매콤한 쭈꾸미", "볶음류"],
			website: "http://www.xn--369ay3l35ejd457e5hhnxn.kr/niabbs5/"
		))
		
		return mockMakgeolliArray
	}
}
