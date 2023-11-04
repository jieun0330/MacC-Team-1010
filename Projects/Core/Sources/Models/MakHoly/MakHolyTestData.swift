//
//  MakHolyTestData.swift
//  Core
//
//  Created by Eric Lee on 11/2/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

extension Award {
	public static var mockDatas: [Award] = [Award.mock1, Award.mock2, Award.mock3]
	
	public static var mock1: Award = Award("2023 우리술 품평회 대상")
	public static var mock2: Award = Award("2023 대한민국 주류대상 은상")
	public static var mock3: Award = Award("2022 우리술 품평회 장려상")
}

extension Brewery {
	public static var mockTenTen: Brewery = Brewery(
		name: "텐텐",
		url: "https://instagram.com/1010_appleacademy?igshid=YTQwZjQ0NmI0OA%3D%3D&utm_source=qr", 
		salesURL: "https://instagram.com/1010_appleacademy?igshid=YTQwZjQ0NmI0OA%3D%3D&utm_source=qr")
	
	public static var mockADA: Brewery = Brewery(
		name: "애플아카데미",
		url: "https://developeracademy.postech.ac.kr/", 
		salesURL: "https://developeracademy.postech.ac.kr/")
	
	public static var mockNoURL: Brewery = Brewery(
		name: "링크없는 양조장",
		url: nil, 
		salesURL: nil)
}

extension Comment {
	public static var mokDatas: [Comment] = [mock1, mock2, mock3, mock4]
	
	public static var mock1: Comment = Comment(
		id: "c-1",
		makHolyId: "m-1",
		userId: "u-1",
		isOpened: true,
		description: "맑은내일 맛있어요!!",
		date: "2022-10-10")
	
	public static var mock2: Comment = Comment(
		id: "c-2",
		makHolyId: "m-1",
		userId: "u-2",
		isOpened: false,
		description: "너무 맛있어요 사람들이 왜 찾는지 알겠음 그렇게 또 사먹어서 안녕하세요 아무말입니다... 너무 맛있어요 사람들이 왜 찾는지 알겠음 그렇게 또 사먹어서 안녕하세요 아무말입니다... 너무 맛있어요 사람들이 왜 찾는지 알겠음 그렇게 또 사먹어서 안녕하세요 아무말입니다... 너무 맛있어요 사람들이 왜 찾는지 알겠음 그렇게 또 사먹어서 안녕하세요 아무말입니다... 너무 맛있어요 사람들이 왜 찾는지 알겠음 그렇게 또 사먹어서 안녕하세요 아무말입니다... 너무 맛있어요 사람들이 왜 찾는지 알겠음 그렇게 또 사먹어서 안녕하세요 아무말입니다...",
		date: "2010-10-10")
	
	public static var mock3: Comment = Comment(
		id: "c-3",
		makHolyId: "m-1",
		userId: "u-3",
		isOpened: false,
		description: "우웩 별로에요.. 다신 안 먹음",
		date: "2010-10-10")
	
	public static var mock4: Comment = Comment(
		id: "c-4",
		makHolyId: "m-1",
		userId: "u-4",
		isOpened: false,
		description: "부모님께 좋은 막걸리 드리느랴 구입했습니다. 감미료가 들어간게 익숙하셔서 그런지 단맛은 덜하다고 하지만 제 입맛엔 꽤 달달한 막걸리입니다. 그만큼 단맛에 길들여지면 맛이 맹맹할 수 있습니다. ^^ 건강에 좋은 막걸리 한 잔 하시죠.",
		date: "2010-10-10")
	
	public static var mock5: Comment = Comment(
		id: "c-5",
		makHolyId: "m-2",
		userId: "u-5",
		isOpened: false,
		description: "와 역전주 진짜 맛있네요👍🏻 단맛이 나는게 신기하네요",
		date: "2010-10-10")
	
	public static var mock6: Comment = Comment(
		id: "c-6",
		makHolyId: "m-2",
		userId: "u-1",
		isOpened: false,
		description: "괜찮아요! 맛 조아요",
		date: "2010-10-10")
}

extension User {
	
	public static var user1: User = User(
		id: "u-1",
		name: "아지",
		bookmarks: ["m-1", "m-7", "m-8", "m-9", "m-10", "m-11"],
		likes: ["m-1", "m-2", "m-6", "m-5", "m-12", "m-13"],
		dislikes: ["m-3", "m-4"],
		comments: ["c-1", "c-6"])
	
	public static var user2: User = User(
		id: "u-2",
		name: "예리미",
		bookmarks: [],
		likes: ["m-1", "m-2", "m-3", "m-4", "m-5", "m-6", "m-7"],
		dislikes: [],
		comments: ["c-2"])
	
	public static var user3: User = User(
		id: "u-3",
		name: "신디",
		bookmarks: [],
		likes: [],
		dislikes: ["m-1", "m-2", "m-3", "m-4", "m-5", "m-6", "m-7"],
		comments: ["c-3"])
	
	public static var user4: User = User(
		id: "u-4",
		name: "테오",
		bookmarks: ["m-1", "m-2", "m-3", "m-4", "m-5", "m-6", "m-7"],
		likes: ["m-1"],
		dislikes: [],
		comments: ["c-4"])
	
	public static var user5: User = User(
		id: "u-5",
		name: "에릭",
		bookmarks: ["m-1"],
		likes: ["m-2", "m-8", "m-9", "m-10"],
		dislikes: [],
		comments: ["c-5"])
}

extension MakHolyMini {
	public static var mokDatas: [MakHolyMini] = [
		test1, test2, test3, test4, test5, test6, test7,
		test8, test9, test10, test11, test12, test13, test14
	]
	
	public static var test1: MakHolyMini = MakHolyMini(
		id: "m-1",
		name: "맑은내일 발효막걸리 시그니처",
		imageId: "824",
		sweetness: 5,
		sourness: 4,
		thickness: -1,
		freshness: 0,
		price: 9000,
		volume: 930,
		adv: 6.5)
	
	
	public static var test2: MakHolyMini = MakHolyMini(
		id: "m-2",
		name: "역전주",
		imageId: "105",
		sweetness: 2,
		sourness: 4,
		thickness: 1,
		freshness: 3,
		price: 11000,
		volume: 600,
		adv: 9)
	
	public static var test3: MakHolyMini = MakHolyMini(
		id: "m-3",
		name: "1000억 유산균 막걸리",
		imageId: "170",
		sweetness: 3,
		sourness: 5,
		thickness: 3,
		freshness: 5,
		price: 3200,
		volume: 750,
		adv: 5)
	
	public static var test4: MakHolyMini = MakHolyMini(
		id: "m-4",
		name: "별산막걸리",
		imageId: "124",
		sweetness: 4,
		sourness: 4,
		thickness: 3,
		freshness: -1,
		price: 11000,
		volume: 800,
		adv: 6.5)
	
	public static var test5: MakHolyMini = MakHolyMini(
		id: "m-5",
		name: "배꽃 필 무렵",
		imageId: "1107",
		sweetness: 1,
		sourness: 2,
		thickness: 3,
		freshness: 1,
		price: 15800,
		volume: 140,
		adv: 9)
	
	public static var test6: MakHolyMini = MakHolyMini(
		id: "m-6",
		name: "이화백주 순탁주",
		imageId: "110",
		sweetness: 4,
		sourness: 3,
		thickness: 4,
		freshness: 3,
		price: 14400,
		volume: 940,
		adv: 6)
	
	public static var test7: MakHolyMini = MakHolyMini(
		id: "m-7",
		name: "이화주",
		imageId: "1108",
		sweetness: 4,
		sourness: 2,
		thickness: 4,
		freshness: 3,
		price: 12350,
		volume: 120,
		adv: 8.5)
	
	public static var test8: MakHolyMini = MakHolyMini(
		id: "m-8",
		name: "우곡생주",
		imageId: "92",
		sweetness: 4,
		sourness: 2,
		thickness: 5,
		freshness: 2,
		price: 10000,
		volume: 750,
		adv: 10)
	
	public static var test9: MakHolyMini = MakHolyMini(
		id: "m-9",
		name: "장수 생막걸리",
		imageId: "141",
		sweetness: 2,
		sourness: 3,
		thickness: 3,
		freshness: 3,
		price: 1500,
		volume: 750,
		adv: 6)
	
	public static var test10: MakHolyMini = MakHolyMini(
		id: "m-10",
		name: "느린마을막걸리 봄",
		imageId: "221",
		sweetness: 4,
		sourness: 1,
		thickness: -1,
		freshness: 2,
		price: 3400,
		volume: 750,
		adv: 6)
	
	public static var test11: MakHolyMini = MakHolyMini(
		id: "m-11",
		name: "정감생막걸리",
		imageId: "799",
		sweetness: 2,
		sourness: 3,
		thickness: 5,
		freshness: 2,
		price: 6000,
		volume: 750,
		adv: 6)
	
	public static var test12: MakHolyMini = MakHolyMini(
		id: "m-12",
		name: "맑은내일 스파클링 막걸리 시그니처",
		imageId: "824",
		sweetness: 4,
		sourness: 4,
		thickness: 4,
		freshness: 4,
		price: 9000,
		volume: 930,
		adv: 6.5)
	
	public static var test13: MakHolyMini = MakHolyMini(
		id: "m-13",
		name: "본",
		imageId: "E4",
		sweetness: -1,
		sourness: -1,
		thickness: -1,
		freshness: 1,
		price: 45000,
		volume: 375,
		adv: 17)
	
	public static var test14: MakHolyMini = MakHolyMini(
		id: "m-14",
		name: "인천 생 소성주",
		imageId: "1068",
		sweetness: 1,
		sourness: 2,
		thickness: 2,
		freshness: 1,
		price: 120,
		volume: 750,
		adv: 6
	)
}

extension MakHoly {
	public static var mockDatas: [MakHoly] = [
		test1, test2, test3, test4, test5, test6, test7,
		test8, test9, test10, test11, test12, test13, test14
	]
	
	public static var test1: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test1,
		comments: [Comment.mock1, Comment.mock2, Comment.mock3, Comment.mock4],
		awards: [Award("2022 대한민국 주류대상 대상")],
		likeUsers: ["u-1", "u-2", "u-4"],
		dislikeUsers: ["u-3"],
		bookmarkUsers: ["u-1", "u-4", "u-5"],
		ingredients: "정제수, 쌀, 누룩(밀), 아밀라아제(효소제), 아스파탐",
		description: "프리미엄 막걸리 맑은내일 발효막걸리 Signature 는 한국 전통 누룩으로 빚어 걸쭉하면서 진하고 누룩 함량이 높아 부드럽고 깊은 향이 일품이다. 묵직한 누룩맛과 부드러운 텍스처, 유산균이 빚어내는 오묘한 산미와 단맛의 조화가 특징이다.  제품이 완성된 후에도 효모는 발효되기 때문에 시간의 경과에 따라 다른 맛과 느낌으로 즐길 수 있다.",
		brewery: Brewery(
			name: "우포의 아침",
			url: "https://www.good-tomorrow.co.kr",
			salesURL: "https://www.good-tomorrow.co.kr/shop/item.php?it_id=1646725796")
	)
	
	public static var test2: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test2,
		comments: [Comment.mock5, Comment.mock6],
		awards: [Award("2021 대한민국 주류대상 대상")],
		likeUsers: ["u-1", "u-2", "u-5"],
		dislikeUsers: ["u-3"],
		bookmarkUsers: ["u-4"],
		ingredients: "정제수, 멥쌀(국내산), 찹쌀(국내산), 누룩",
		description: "역전주는 역전회관에서 자체 기획 및 전통방식으로 소량 생산하는 private brand 로 100% 국내산 쌀과 찹쌀, 누룩, 물만으로 빚어 저온 발효와 숙성을 거쳐 쌀 본연의 은은한 단맛과 산미가 특징이다. 인공감미료나 첨가물을 넣지 않고 약 100일간의 자연발효과 저온숙성을 거치면서 계절의 온도와 쌀의 풍미가 오롯이 담긴 막걸리다. 알콜도수는 9도로 음식과 함께 즐기기에 좋고, 목넘김이 부드러운 것이 특징이다.",
		brewery: Brewery(
			name: "국순당",
			url: "http://drink.ksdb.co.kr/",
			salesURL: nil)
	)
	
	public static var test3: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test3,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	
	public static var test4: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test4,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	public static var test5: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test5,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	public static var test6: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test6,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	public static var test7: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test7,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	public static var test8: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test8,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	public static var test9: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test9,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	public static var test10: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test10,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	public static var test11: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test11,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	public static var test12: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test12,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	public static var test13: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test13,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	public static var test14: MakHoly = MakHoly(
		makHolyMini: MakHolyMini.test14,
		comments: [],
		awards: [],
		likeUsers: [],
		dislikeUsers: [],
		bookmarkUsers: [],
		ingredients: "",
		description: "",
		brewery: Brewery(
			name: "임시",
			url: nil,
			salesURL: nil)
	)
	
}
