//
//  MakHolyImageView.swift
//  Core
//
//  Created by Eric Lee on 11/4/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Kingfisher

public struct MakHolyImageView: View {
	let imageId: String
	let type: ImageType
	let ratio: ImageRatioType
	var imageURL: URL? {
		let baseURL = "https://d2hyndjmu9mjcd.cloudfront.net/images/"
		let urlString = "\(baseURL)\(imageId).png?\(self.type.query)&\(self.ratio.query)"
		return URL(string: urlString)
	}
	
	public init(
		imageId: String,
		type: ImageType,
		ratio: ImageRatioType = .outside) {
			self.imageId = imageId
			self.type = type
			self.ratio = ratio
		}
	
	public var body: some View {
		KFImage(self.imageURL)
			.placeholder {
				ProgressView()
			}
			.loadDiskFileSynchronously()
			.cacheMemoryOnly()
			.fade(duration: 0.15)
			.retry(maxCount: 3, interval: .seconds(5))
			.resizable()
			.onFailure { error in
				print("Image loading failed with error: \(error)")
			}
			.scaledToFit()
			.frame(width: self.type.size.width, height: self.type.size.height)
	}
}
