//
//  CameraView.swift
//  ProjectDescriptionHelpers
//
//  Created by Kim SungHun on 2023/11/23.
//

import SwiftUI
import DesignSystem

public struct CameraView: View {
	@ObservedObject public var viewModel: CameraViewModel
	
	@Binding public var isCameraViewPresented: Bool
	@Binding public var showPermissionAlert: Bool
	
	public init(viewModel: CameraViewModel,
				isCameraViewPresented: Binding<Bool>,
				showPermissionAlert: Binding<Bool>) {
		self.viewModel = viewModel
		_isCameraViewPresented = isCameraViewPresented
		_showPermissionAlert = showPermissionAlert
	}
	
	public var body: some View {
		GeometryReader { geometry in
			ZStack {
				viewModel.cameraPreview.ignoresSafeArea()
					.onAppear {
						viewModel.configure()
					}
				
				Rectangle()
					.foregroundColor(Color.black.opacity(0.5))
					.mask(
						Window(size: CGSize(width: UIScreen.main.bounds.size.width - 32,
											height: UIScreen.main.bounds.size.height / 2))
						.fill(style: FillStyle(eoFill: true))
					)
					.ignoresSafeArea()
				
				RoundedRectangle(cornerRadius: 32).stroke(Color.white, lineWidth: 2)
					.frame(width: UIScreen.main.bounds.size.width - 32,
						   height: UIScreen.main.bounds.size.height / 2)
					.padding(.bottom, geometry.safeAreaInsets.bottom)
					.padding(.bottom, 64)
				
				VStack {
					Spacer()
					Text("최대한 다른 사진이 안나오고 막걸리 라벨에 가깝게 찍어주세요 ~~~~")
					Spacer()
						.frame(height: 16)
					Button(action: {viewModel.capturePhoto()}) {
						Image(uiImage: .designSystem(.shutter)!)
							.resizable()
							.frame(width: 72, height: 72)
					}
					.padding(.bottom, 36)
				}
				.foregroundColor(.white)
			}
		}
		.alert(isPresented: $showPermissionAlert) {
			Alert(title: Text("카메라 권한 오류"), message: Text("막걸리 스캔을 위해서는 카메라 권한 설정이 필요해요. 설정에서 카메라 권한을 확인해주세요."),
				  dismissButton: .default(Text("확인"), action: {
				isCameraViewPresented = false
			}))
		}
	}
}

struct Window: Shape {
	let size: CGSize
	
	func path(in rect: CGRect) -> Path {
		var path = Rectangle().path(in: rect)
		
		let origin = CGPoint(x: rect.midX - size.width / 2, y: rect.midY - size.height / 2 - 64)
		path.addRoundedRect(in: CGRect(origin: origin, size: size),
							cornerSize: CGSize(width: 32, height: 32))
		return path
	}
}
