//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/10/03.
//

import SwiftUI
import Core
import DesignSystem
import Utils
import FeatureEncyclopedia
import FeatureHome
import FeatureProfile
import FeatureSearch
import FeatureOnboarding
import FeatureInformation

import AVFoundation
import UIKit
import Vision

public struct RootView: View {
	public init() {
		setCustomNavigationBar()
	}
	
	private let randomNickname = ["걸쭉한라쿤", "상큼한라쿤", "달달한라쿤",
								  "상큼한수달", "포근한여우", "날렵한곰"]
	
	public var body: some View {
		if KeyChainManager.shared.read(account: .userId).isEmpty {
			OnboardingView(nickname: randomNickname.randomElement()!)
		} else {
			TabView {
				HomeView()
					.tabItem {
						Image(uiImage: .designSystem(.home)!)
						Text("홈")
							.font(.style(.SF10B))
					}
				SearchView()
					.tabItem {
						Image(uiImage: .designSystem(.search)!)
						Text("검색")
							.font(.style(.SF10B))
					}
				EncyclopediaView()
					.tabItem {
						Image(uiImage: .designSystem(.heart)!)
						Text("내 막걸리")
							.font(.style(.SF10B))
					}
				ProfileView()
					.tabItem {
						Image(uiImage: .designSystem(.person)!)
						Text("내 정보")
							.font(.style(.SF10B))
					}
			}
		}
	}
}

//MARK: - Camera

struct TempCameraView: View {
	@State private var isShowingImagePicker = false
	@State private var image: UIImage = UIImage()
	@State var makId: Int?
	
	let imagePredictor = ImagePredictor()
	let predictionsToShow = 1 // return 값 몇개 받을건지?
	
	var body: some View {
		Button(action: {
			let status = AVCaptureDevice.authorizationStatus(for: .video)
			
			if status == .authorized {
				// 카메라 접근 권한이 이미 허용 상태인 경우
				isShowingImagePicker.toggle()
			} else if status == .notDetermined {
				AVCaptureDevice.requestAccess(for: .video) { accessGranted in
					DispatchQueue.main.async {
						if accessGranted {
							// 지금 카메라 접근 권한을 허용한 경우
							isShowingImagePicker.toggle()
						} else {
							// 카메라 접근 권한 거부 상태인 경우
							// alert
						}
					}
				}
			} else {
				// 카메라 접근 권한 거부 상태인 경우
				// alert
			}
		}) {
			Text("나와라 카메라")
				.font(.style(.SF20B))
		}
		.sheet(isPresented: $isShowingImagePicker, onDismiss: {
			// start loading
			
			userSelectedPhoto(image)
		}) {
			// 모달로 띄울 뷰를 정의
			ImagePicker(image: $image, isShown: $isShowingImagePicker)
		}
		.fullScreenCover(item: $makId) { makHolyId in
			InformationView(makHolyId: makHolyId)
		}
	}
}

extension TempCameraView {
	func userSelectedPhoto(_ photo: UIImage) {
		DispatchQueue.global(qos: .userInitiated).async {
			self.classifyImage(photo)
		}
	}
	
	private func classifyImage(_ image: UIImage) {
		do {
			try self.imagePredictor.makePredictions(for: image,
													completionHandler: imagePredictionHandler)
		} catch {
			print("Vision was unable to make a prediction...\n\n\(error.localizedDescription)")
		}
	}
	
	private func imagePredictionHandler(_ predictions: [ImagePredictor.Prediction]?) {
		guard let predictions = predictions else {
			return
		}
		
		let formattedPredictions = formatPredictions(predictions)
		
		let predictionString = formattedPredictions.joined(separator: "\n")
		print("predictionString \(predictionString)")
		
		let splitValue = predictionString.split(separator: " ")
		
		// finish loading
		
		if Double(splitValue[1]) ?? -1.0 >= 70.0 {
			makId = Int(splitValue[0]) ?? -1
		} else {
			// alert
			// 찾는 막걸리가 없어요..
		}
	}
	
	private func formatPredictions(_ predictions: [ImagePredictor.Prediction]) -> [String] {
		let topPredictions: [String] = predictions.prefix(predictionsToShow).map { prediction in
			var name = prediction.classification
			
			if let firstComma = name.firstIndex(of: ",") {
				name = String(name.prefix(upTo: firstComma))
			}
			
			// return "\(name) - \(prediction.confidencePercentage)%"
			return "\(name) \(prediction.confidencePercentage)"
		}
		
		return topPredictions
	}
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate,
							  UIImagePickerControllerDelegate {
	@Binding var image: UIImage
	@Binding var isShown: Bool
	
	init(image: Binding<UIImage>, isShown: Binding<Bool>) {
		_image = image
		_isShown = isShown
	}
	
	func imagePickerController(_ picker: UIImagePickerController,
							   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			image = uiImage
			isShown = false
		}
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		isShown = false
	}
}

struct ImagePicker: UIViewControllerRepresentable {
	typealias UIViewControllerType = UIImagePickerController
	typealias Coordinator = ImagePickerCoordinator
	
	@Binding var image: UIImage
	@Binding var isShown: Bool
	
	var sourceType: UIImagePickerController.SourceType = .camera
	
	func makeUIViewController(context: Context) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.sourceType = sourceType
		picker.delegate = context.coordinator
		
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
		
	}
	
	func makeCoordinator() -> ImagePicker.Coordinator {
		return ImagePickerCoordinator(image: $image, isShown: $isShown)
	}
}
