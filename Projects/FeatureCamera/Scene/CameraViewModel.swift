//
//  CameraViewModel.swift
//  FeatureCamera
//
//  Created by Kim SungHun on 2023/11/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import UIKit
import AVFoundation

public final class CameraViewModel: ObservableObject {
	@Binding var image: UIImage
	@Binding var isCameraViewPresented: Bool
	@Binding var showPermissionAlert: Bool
	
	private let model: Camera
	private let session: AVCaptureSession
	let cameraPreview: AnyView
	var photoData = Data(count: 0)
	
	public init(image: Binding<UIImage>, isCameraViewPresented: Binding<Bool>,
				showPermissionAlert: Binding<Bool>) {
		_image = image
		_isCameraViewPresented = isCameraViewPresented
		_showPermissionAlert = showPermissionAlert
		model = Camera(image: image, isCameraViewPresented: isCameraViewPresented,
					   showPermissionAlert: showPermissionAlert)
		session = model.session
		cameraPreview = AnyView(CameraPreviewView(session: session))
	}
	
	func configure() {
		model.requestAndCheckPermissions()
	}
	
	func capturePhoto() {
		model.capturePhoto()
	}
}
