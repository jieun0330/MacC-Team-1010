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
		imageURL: "https://developeracademy.postech.ac.kr/",
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
	
}
