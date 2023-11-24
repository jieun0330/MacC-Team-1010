//
//  Camera.swift
//  FeatureCamera
//
//  Created by Kim SungHun on 2023/11/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import AVFoundation

final class Camera: NSObject, ObservableObject {
	@Binding var image: UIImage
	@Binding var isCameraViewPresented: Bool
	@Binding var showPermissionAlert: Bool
	
	var session = AVCaptureSession()
	var videoDeviceInput: AVCaptureDeviceInput!
	let output = AVCapturePhotoOutput()
	
	init(image: Binding<UIImage>,
		 isCameraViewPresented: Binding<Bool>,
		 showPermissionAlert: Binding<Bool>
	) {
		_image = image
		_isCameraViewPresented = isCameraViewPresented
		_showPermissionAlert = showPermissionAlert
	}
	
	func savePhoto(_ imageData: Data) {
		guard let image = UIImage(data: imageData) else { return }
		isCameraViewPresented = false
		self.image = image
	}
	
	func capturePhoto() {
		let photoSettings = AVCapturePhotoSettings()
		self.output.capturePhoto(with: photoSettings, delegate: self)
	}
	
	func setUpCamera() {
		if let device = AVCaptureDevice.default(.builtInWideAngleCamera,
												for: .video, position: .back) {
			do {
				videoDeviceInput = try AVCaptureDeviceInput(device: device)
				if session.canAddInput(videoDeviceInput) {
					session.addInput(videoDeviceInput)
				}
				
				if session.canAddOutput(output) {
					session.addOutput(output)
					output.isHighResolutionCaptureEnabled = true
					output.maxPhotoQualityPrioritization = .quality
				}
				session.startRunning()
			} catch {
				print(error)
			}
		}
	}
	
	func requestAndCheckPermissions() {
		let status = AVCaptureDevice.authorizationStatus(for: .video)
		
		if status == .authorized {
			// 카메라 접근 권한이 이미 허용 상태인 경우
			self.setUpCamera()
		} else if status == .notDetermined {
			AVCaptureDevice.requestAccess(for: .video) { accessGranted in
				DispatchQueue.main.async {
					if accessGranted {
						// 지금 카메라 접근 권한을 허용한 경우
						self.setUpCamera()
					} else {
						// 카메라 접근 권한 거부 상태인 경우
						self.showPermissionAlert = true
					}
				}
			}
		} else {
			// 카메라 접근 권한 거부 상태인 경우
			self.showPermissionAlert = true
		}
	}
}

extension Camera: AVCapturePhotoCaptureDelegate {
	func photoOutput(_ output: AVCapturePhotoOutput,
					 willBeginCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
	}
	
	func photoOutput(_ output: AVCapturePhotoOutput,
					 willCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
	}
	
	func photoOutput(_ output: AVCapturePhotoOutput,
					 didCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
	}
	
	func photoOutput(_ output: AVCapturePhotoOutput,
					 didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
		guard let imageData = photo.fileDataRepresentation() else { return }
		self.savePhoto(imageData)
	}
}

struct CameraPreviewView: UIViewRepresentable {
	class VideoPreviewView: UIView {
		override class var layerClass: AnyClass {
			AVCaptureVideoPreviewLayer.self
		}
		
		var videoPreviewLayer: AVCaptureVideoPreviewLayer {
			return layer as! AVCaptureVideoPreviewLayer
		}
	}
	
	let session: AVCaptureSession
	
	func makeUIView(context: Context) -> VideoPreviewView {
		let view = VideoPreviewView()
		
		view.videoPreviewLayer.session = session
		view.backgroundColor = .black
		view.videoPreviewLayer.videoGravity = .resizeAspectFill
		view.videoPreviewLayer.cornerRadius = 0
		view.videoPreviewLayer.connection?.videoOrientation = .portrait
		
		return view
	}
	
	func updateUIView(_ uiView: VideoPreviewView, context: Context) {
		
	}
}
