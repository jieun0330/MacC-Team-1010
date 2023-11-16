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
	
	@State private var isFailingToLoad = false
	@State private var failureCount: Int = 0
	
	var imageURL: URL? {
		if let baseURL = Bundle.main.infoDictionary?["IMAGE_API_URL"] as? String {
			let urlString = "\(baseURL)\(imageId).png?\(self.type.query)&\(self.ratio.query)"
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
			.onFailure { error in
				print("Image loading failed with error: \(error)")
				failureCount += 1
				if failureCount >= 2 {
					isFailingToLoad = true
				}
			}
			.onFailureImage(
				UIImage(
					named: "errorImage",
					in: Bundle(identifier: "com.tenten.julookdesignsystem"),
					with: nil)
			)
			.scaledToFit()
			.frame(width: self.type.size.width, height: self.type.size.height)
			.grayscale(isFailingToLoad ? 1.0 : 0.0)
	}
}
