//
//  MakHolyTestData.swift
//  Core
//
//  Created by Eric Lee on 11/2/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

extension Award {
	public static var mock1: Award = Award(year: 2023, name: "우리술 품평회", type: "대상")
	public static var mock2: Award = Award(year: 2023, name: "대한민국 주류대상", type: "은상")
	public static var mock3: Award = Award(year: 2022, name: "우리술 품평회", type: "장려상")
}

extension Brewery {
	public static var mockTenTen: Brewery = Brewery(
		name: "텐텐",
		url: "https://instagram.com/1010_appleacademy?igshid=YTQwZjQ0NmI0OA%3D%3D&utm_source=qr")
	
	public static var mockADA: Brewery = Brewery(
		name: "애플아카데미",
		url: "https://developeracademy.postech.ac.kr/")
	
	public static var mockNoURL: Brewery = Brewery(
		name: "링크없는 양조장",
		url: nil)
}

extension Comment {
	public static var mockOpened: Comment = Comment(
		description: "코멘트 남긴 내용 맛있어요",
		isOpened: true,
		date: "2022-10-28")

	public static var mockNotOpened: Comment = Comment(
		description: "코멘트 남긴 내용 맛 없어요",
		isOpened: false,
		date: "2022-10-10")
}

extension Taste {
	public static var mock1: Taste = Taste(sweetness: .five, sourness: .four, thickness: .three, freshness: .two)
	public static var mock2: Taste = Taste(sweetness: .none, sourness: .zero, thickness: .one, freshness: .two)
}

extension Review {
	public static var mockOpened: Review = Review(name: "리이오", likeState: .like, comment: Comment.mockOpened)
	public static var mockNotOpened: Review = Review(name: "도라", likeState: .like, comment: Comment.mockNotOpened)
}

extension MakHoly {
	public static var test1: MakHoly = MakHoly(
		id: "test1-ID",
		name: "텐텐 막걸리",
		imageURL: "https://thesool.com/common/imageView.do?targetId=PR00000943&targetNm=PRODUCT",
		adv: 10,
		volume: 5000,
		price: 10000,
		taste: Taste.mock1,
		description: "우주 최강 텐텐 팀의 텐텐 막걸리입니다. 멋있고, 귀엽고, 섹시하고, 이쁘고, 깜찍하고, 알레강스하며 귵합니다.",
		awards: [Award.mock1, Award.mock2, Award.mock3],
		ingredients: ["쌀(국내산/무농약)", "효모", "누룩(밀/국내산)", "정제수"],
		salesURL: "https://instagram.com/1010_appleacademy?igshid=YTQwZjQ0NmI0OA%3D%3D&utm_source=qr",
		brewery: Brewery.mockTenTen,
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [Review.mockOpened, Review.mockNotOpened])
	
	public static var test2: MakHoly = MakHoly(
		id: "test2-ID",
		name: "애플 막걸리",
		imageURL: "https://thesool.com/common/imageView.do?targetId=PR00000943&targetNm=PRODUCT",
		adv: 10.10,
		volume: 650,
		price: 10000,
		taste: Taste.mock2,
		description: "마시면 월클되는 막걸리",
		awards: [Award.mock1, Award.mock2, Award.mock3],
		ingredients: ["쌀(국내산/무농약)", "효모", "누룩(밀/국내산)", "정제수"],
		salesURL: "https://developeracademy.postech.ac.kr/",
		brewery: Brewery.mockADA,
		myLikeState: .like,
		isBookMarked: true,
		myComment: Comment.mockOpened,
		reviews: [Review.mockOpened, Review.mockNotOpened])
	
	public static var mockMakHolies: [MakHoly] = [mock1, mock2, mock3, mock4, mock5, mock6, mock7, mock8, mock9, mock10, mock11, mock12, mock13, mock14]
	
	public static var mock1: MakHoly = MakHoly(
		id: "824",
		name: "맑은내일 발효막걸리 시그니처",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/824.png?w=118&h=244&t=outside",
		adv: 6.5,
		volume: 930,
		price: 9000,
		taste: Taste(sweetness: .four, sourness: .four, thickness: .four, freshness: .four),
		description: "프리미엄 막걸리 맑은내일 발효막걸리 Signature 는 한국 전통 누룩으로 빚어 걸쭉하면서 진하고 누룩 함량이 높아 부드럽고 깊은 향이 일품이다. 묵직한 누룩맛과 부드러운 텍스처, 유산균이 빚어내는 오묘한 산미와 단맛의 조화가 특징이다.  제품이 완성된 후에도 효모는 발효되기 때문에 시간의 경과에 따라 다른 맛과 느낌으로 즐길 수 있다.",
		awards: [Award(year: 2022, name: "대한민국 주류대상", type: "대상")],
		ingredients: ["정제수", "쌀", "누룩(밀)", "아밀라아제(효소제)", "아스파탐"],
		salesURL: "https://www.good-tomorrow.co.kr/shop/item.php?it_id=1646725796",
		brewery: Brewery(name: "우포의 아침", url: "https://www.good-tomorrow.co.kr"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock2: MakHoly = MakHoly(
		id: "105",
		name: "역전주",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/105.png?w=118&h=244&t=outside",
		adv: 9,
		volume: 600,
		price: 11000,
		taste: Taste(sweetness: .two, sourness: .four, thickness: .one, freshness: .three),
		description: "역전주는 역전회관에서 자체 기획 및 전통방식으로 소량 생산하는 private brand 로 100% 국내산 쌀과 찹쌀, 누룩, 물만으로 빚어 저온 발효와 숙성을 거쳐 쌀 본연의 은은한 단맛과 산미가 특징이다. 인공감미료나 첨가물을 넣지 않고 약 100일간의 자연발효과 저온숙성을 거치면서 계절의 온도와 쌀의 풍미가 오롯이 담긴 막걸리다. 알콜도수는 9도로 음식과 함께 즐기기에 좋고, 목넘김이 부드러운 것이 특징이다.",
		awards: [Award(year: 2021, name: "대한민국 주류대상", type: "대상")],
		ingredients: ["정제수", "멥쌀", "찹쌀(국내산)", "누룩"],
		salesURL: nil,
		brewery: Brewery(name: "국순당", url: "http://drink.ksdb.co.kr/"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock3: MakHoly = MakHoly(
		id: "170",
		name: "1000억 유산균 막걸리",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/170.png?w=118&h=244&t=outside",
		adv: 5,
		volume: 750,
		price: 3200,
		taste: Taste(sweetness: .three, sourness: .five, thickness: .three, freshness: .five),
		description: "1000억 유산균 막걸리는 국순당이 최초로 선보인 유산균 강화 막걸리다. 식물성 유산균이 막걸리 한 병(750mL)에 1000억 마리 이상이 들어 있다. 시중에 판매되는 일반 생막걸리 한 병(자사 생막걸리 750mL 기준)당 1억 마리 가량의 유산균이 들어 있는 것과 비교하면 약 1000배 많이 들어있고, 일반 유산균음료 보다 약 100배 많이 들어 있다.",
		awards: [Award(year: 2021, name: "대한민국 주류대상", type: "대상"), Award(year: 2020, name: "대한민국 주류대상", type: "대상")],
		ingredients: ["정제수", "멥쌀(국내산)", "기타과당", "국(밀)", "효모", "젖산"],
		salesURL: nil,
		brewery: Brewery(name: "역전양조장", url: "www.yukjeon.com"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock4: MakHoly = MakHoly(
		id: "124",
		name: "별산막걸리",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/124.png?w=118&h=244&t=outside",
		adv: 6.5,
		volume: 800,
		price: 11000,
		taste: Taste(sweetness: .four, sourness: .four, thickness: .three, freshness: .none),
		description: "별산막걸리는 경기도 양주의 단단한 쌀을 사용하고 어느 누구도 시도하지 않은 특별한 발효균주를 이용하여 만든 프리미엄 막걸리다. 맛과 품질에서 우수함을 인정 받은 결과 대한민국주류대상  3회 수상 경력의 귀한 막걸리.다",
		awards: [Award(year: 2020, name: "대한민국 주류대상", type: "대상"), Award(year: 2020, name: "우리술 품평회", type: "최우수상")],
		ingredients: ["정제수", "쌀", "입국", "당류가공품", "종국", "효모"],
		salesURL: nil,
		brewery: Brewery(name: "양주도가", url: "https://smartstore.naver.com/yangjudoga"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock5: MakHoly = MakHoly(
		id: "1107",
		name: "배꽃 필 무렵",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/1107.png?w=118&h=244&t=outside",
		adv: 9,
		volume: 140,
		price: 15800,
		taste: Taste(sweetness: .one, sourness: .two, thickness: .three, freshness: .one),
		description: "‘배꽃 필 무렵’은 이화주다. 이화주는 ‘배꽃 필 때 빚는다’ 하여 이화주(梨花酒)라고 불린다. 이화주는 고려시대 때부터 빚어졌던 술로, 빛깔이 희고 된죽과 같아 숟가락으로 떠먹기도 하고, 찬물에 타서 마시기도 한다.",
		awards: [Award(year: 2020, name: "우리술 품평회", type: "최우상")],
		ingredients: ["쌀", "누룩", "잣나무잎", "정제수"],
		salesURL: nil,
		brewery: Brewery(name: "예술주조", url: "http://www.ye-sul.co.kr"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock6: MakHoly = MakHoly(
		id: "110",
		name: "이화백주 순탁주",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/110.png?w=118&h=244&t=outside",
		adv: 6,
		volume: 940,
		price: 14400,
		taste: Taste(sweetness: .four, sourness: .three, thickness: .four, freshness: .three),
		description: "국내산 햅쌀 100%와 전통누룩으로 빚어 15일간 저온에서 자연 발효했다. 첨가물을 넣지 않고 전통방식으로 빚어 부드러우면서도 풍미가 뛰어나다. 탄산의 경쾌함과 레몬 맛과 같은 시트러스 계열의 맛과 향이 느껴진다.",
		awards: [Award(year: 2019, name: "대한민국 주류대상", type: "대상")],
		ingredients: ["정제수", "쌀", "누룩(밀함유)", "물엿", "설탕", "아스파탐"],
		salesURL: nil,
		brewery: Brewery(name: "이화백주", url: "https://www.facebook.com/ehwayangzo/"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock7: MakHoly = MakHoly(
		id: "1108",
		name: "이화주",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/1108.png?w=118&h=244&t=outside",
		adv: 8.5,
		volume: 120,
		price: 12350,
		taste: Taste(sweetness: .four, sourness: .two, thickness: .four, freshness: .three),
		description: "이화주는 고려시대 때부터 빚어졌던 술로써 물을 거의 사용하지 않는 다는 것이 가장 큰 특징이며 농축 요구르트와 같은 된 죽 형태이고 달달한 맛과 독특한 향이 특징입니다.",
		awards: [Award(year: 2022, name: "우리술 품평회", type: "대상"), Award(year: 2019, name: "대한민국 주류대상", type: "대상"), Award(year: 2018, name: "대한민국 주류대상", type: "대상"), Award(year: 2017, name: "대한민국 주류대상", type: "대상"), Award(year: 2016, name: "대한민국 주류대상", type: "대상")],
		ingredients: ["쌀", "쌀누룩", "정제수"],
		salesURL: nil,
		brewery: Brewery(name: "양주골이가", url: "http://egaju.co.kr/"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock8: MakHoly = MakHoly(
		id: "92",
		name: "우곡생주",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/92.png?w=118&h=244&t=outside",
		adv: 10,
		volume: 750,
		price: 10000,
		taste: Taste(sweetness: .four, sourness: .two, thickness: .five, freshness: .two),
		description: "우곡 생주는 일생을 전통주를 위해 헌신한 고 배상면 회장의 마지막 역작을 바탕으로 딸인 배혜정 대표가 아버지의 이념을 계승한 제품이다. 막걸리에 첨가물을 일절 사용하지 않아 인위적은 맛을 내지 않고 쌀 고유의 맛으로 빚은 막걸리이다. 일반 탁주와 달리 가수를 거의 하지않아 바디감이 휼륭하고 작은량의 생산만 되는 귀한 술이며 농후한 원주의 맛을 느낄 수 있다.",
		awards: [Award(year: 2019, name: "우리술 품평회", type: "대상")],
		ingredients: ["정제수", "쌀", "효모", "국(조효소제, 정제효소)", "젖산(산도조절제)"],
		salesURL: nil,
		brewery: Brewery(name: "배혜정도가", url: "http://www.baedoga.co.kr/"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock9: MakHoly = MakHoly(
		id: "141",
		name: "장수 생막걸리",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/141.png?w=118&h=244&t=outside",
		adv: 6,
		volume: 750,
		price: 1500,
		taste: Taste(sweetness: .two, sourness: .three, thickness: .three, freshness: .three),
		description: "국내산 백미를 사용해 장기저온숙성 방식으로 만들어져 영양이 풍부하고 자연발효에 의한 탄산과 어울려 감칠맛과 청량감이 일품입니다. 또한, 트림과 숙취도 거의 없어 오랜 시간 동안 사랑을 받고 있습니다.",
		awards: [Award(year: 2020, name: "대한민국 주류대상", type: "대상"), Award(year: 2019, name: "우리술 품평회", type: "우수상")],
		ingredients: ["쌀(백미)", "팽화미", "입국", "말토올리고당", "곡자", "아스파탐(감미료)", "구연산", "기타가공품(보울라디 효모)", "정제수"],
		salesURL: nil,
		brewery: Brewery(name: "서울장수주식회사", url: "https://seouljangsu.modoo.at/"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock10: MakHoly = MakHoly(
		id: "221",
		name: "느린마을막걸리 봄",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/221.png?w=118&h=244&t=outside",
		adv: 6,
		volume: 750,
		price: 3400,
		taste: Taste(sweetness: .four, sourness: .one, thickness: .none, freshness: .two),
		description: "느린 마을 막걸리의 1~5일차 봄맛으로 달콤한 향과 부드러운 목넘김이 특징이다.",
		awards: [Award(year: 2017, name: "우리술 품평회", type: "최우수상"), Award(year: 2014, name: "우리술 품평회", type: "우수상")],
		ingredients: ["정제수", "쌀가루", "입국(쌀입국)", "조효소제", "건조효모", "정제효소제"],
		salesURL: nil,
		brewery: Brewery(name: "배상면주가", url: "https://www.soolsool.co.kr/"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock11: MakHoly = MakHoly(
		id: "799",
		name: "정감생막걸리",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/799.png?w=118&h=244&t=outside",
		adv: 6,
		volume: 750,
		price: 6000,
		taste: Taste(sweetness: .two, sourness: .three, thickness: .five, freshness: .two),
		description: "깊은 산골 청정수와 신토불이 하동산 쌀과 찹쌀 그리고 우리밀 누룩으로 장기 저온에서 발효숙성하여 장인의 정성이 빚어낸 한 잔에 오미를 담아 달빛같은 감성이 살아 숨쉬는 전통 곡주이다.",
		awards: [],
		ingredients: ["정제수", "쌀(국내산, 수입산)", "밀가루(수입산)", "입국", "발효미강(미강)", "곡자(누룩)", "조효소제(밀)", "사카린나트륨(감미료)", "젖산", "식품첨가물혼합제제(충무정제효소, 송천효모)"],
		salesURL: nil,
		brewery: Brewery(name: "악양주조", url: "https://smartstore.naver.com/akyangjujo"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock12: MakHoly = MakHoly(
		id: "824",
		name: "맑은내일 스파클링 막걸리 시그니처",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/824.png?w=118&h=244&t=outside",
		adv: 6.5,
		volume: 930,
		price: 9000,
		taste: Taste(sweetness: .four, sourness: .four, thickness: .four, freshness: .four),
		description: "프리미엄 막걸리 맑은내일 발효막걸리 Signature 는 한국 전통 누룩으로 빚어 걸쭉하면서 진하고 누룩 함량이 높아 부드럽고 깊은 향이 일품이다. 묵직한 누룩맛과 부드러운 텍스처, 유산균이 빚어내는 오묘한 산미와 단맛의 조화가 특징이다.  제품이 완성된 후에도 효모는 발효되기 때문에 시간의 경과에 따라 다른 맛과 느낌으로 즐길 수 있다.",
		awards: [Award(year: 2022, name: "대한민국 주류대상", type: "대상")],
		ingredients: ["정제수", "쌀", "누룩(밀)", "아밀라아제(효소제)", "아스파탐"],
		salesURL: nil,
		brewery: Brewery(name: "우포의아침", url: "http://www.good-tomorrow.co.kr"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock13: MakHoly = MakHoly(
		id: "E4",
		name: "본",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/E4.png?w=118&h=244&t=outside",
		adv: 17,
		volume: 375,
		price: 45000,
		taste: Taste(sweetness: .none, sourness: .none, thickness: .none, freshness: .one),
		description: "자연만이 주는 재료들이 시간(숙성)을 빌어 내는 향기. 달콤한 바나나향과 향긋한 참외 향이 주는 신비로운 첫 만남! 혀 끝에 닿아 밀려오는 향기 품은 달콤한은 혀의 전부를 감미롭게 도는 듯 싶다가, 이내 거친 17% 풍미의 여운을 남기고는 목 넘어 깊숙한 곳으로 사라지고 만다.",
		awards: [Award(year: 2023, name: "우리술 품평회", type: "대통령상")],
		ingredients: ["국", "쌀", "효모", "정제수"],
		salesURL: nil,
		brewery: Brewery(name: "두루미 양조장", url: "http://xn--hu1b40gh1c27n9rc18a.kr/index.html"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
	
	public static var mock14: MakHoly = MakHoly(
		id: "1068",
		name: "인천 생 소성주",
		imageURL: "https://d2hyndjmu9mjcd.cloudfront.net/images/1068.png?w=118&h=244&t=outside",
		adv: 6,
		volume: 750,
		price: 1200,
		taste: Taste(sweetness: .one, sourness: .two, thickness: .two, freshness: .one),
		description: "기존의 막걸리의 이미지가 남성적이고 투박하며 거칠고 탁한 맛이었다면 생소성주는 여성들과 젊은층도 선호할 수 있도록 숙성시간과 담금횟수를 늘려 부드럽고 톡 쏘는 청량감이 느껴져 누구나 부담없이 마실수 있도록 하였다.인천의 통일신라 시대 이름인 소성현에서 이름이 유래한 생소성주는 80년 넘게 막걸리를 빚으며 업계최초로 쌀로 만든 막걸리를 만들었고, 인천지역 최고의 점유률을 자랑하는 대표 막걸리이다.또한 포장에는 소비자들에게 즐길거리를 제공하기 위해 12간지 동물을 그려넣어 막걸리를 마시면서 재미있는 대화의 소재가 될수 있도록 하였다.생소성주는 성인이라면 누구나 마음편하게 마실수 있도록 부담없는 가격으로 공급해야 한다는 마인드를 바탕으로 지속적인 연구와 개발을 끊임없이 하고 있다1990년 업계 최초로 쌀 막걸리를 출시한 인천탁주. 90년대 초부터 수출을 시작하고 92년 우수 포장선정 국세청장의 표창까지 받은 유서 깊은 양조으로, 인천지역 막걸리 시장의 큰손으로 자리매김하고 있다. 지난 1974년 인천지역의 11개 양조장의 합병으로 만들어져 72년간의 오랜 경험을 바탕으로 인천의 자부심을 가지고 막걸리를 빚고 있다.생 소성주는 숙성시간과 담금 횟수를 늘려 부드럽고 톡 쏘는 탄산의 상쾌한 청량감이 느껴지며, 특유의 감칠맛이 매력적이다.",
		awards: [],
		ingredients: ["정제수", "쌀(멤쌀)", "팽화미", "올리고당", "곡자(밀함유)", "효모(우유함유)", "종국", "정제효소제", "아스파탐", "구연산"],
		salesURL: nil,
		brewery: Brewery(name: "인천탁주", url: "http://sosungju.modoo.at/"),
		myLikeState: .none,
		isBookMarked: false,
		myComment: nil,
		reviews: [])
}
