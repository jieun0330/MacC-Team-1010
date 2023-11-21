//
//  MakHolyImageView.swift
//  Core
//
//  Created by Eric Lee on 11/4/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Kingfisher
import DesignSystem

public struct MakHolyImageView: View {
	let imageId: String
	let type: ImageType
	let ratio: ImageRatioType
	
	var imageURL: URL? {
		if let baseURL = Bundle.main.infoDictionary?["IMAGE_API_URL"] as? String {
			let urlString = "\(baseURL)\(imageId).webp"
			return URL(string: urlString)
		}
		return nil
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
			.retry(maxCount: 2, interval: .seconds(3))
			.resizable()
			.onFailureImage(.designSystem(.errorImage)!)
			.scaledToFit()
			.frame(width: self.type.size.width, height: self.type.size.height)
	}
}
