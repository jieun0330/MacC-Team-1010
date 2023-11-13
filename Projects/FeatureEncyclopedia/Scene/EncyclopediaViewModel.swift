//
//  EncyclopediaViewModel.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/10.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Core
import Utils

final class EncyclopediaViewModel: ObservableObject {
    @Published var makModel: [GetUserMakFolderContent] = []
    
    var fetchLoading = false    
    let userRepository: DefaultUserRepository
    
    init(userRepository: DefaultUserRepository) {
        self.userRepository = userRepository
    }
    
    // getUserMakFolder 호출
    @MainActor
    func getUserMakFolder() {
        Task {
            do {
                let response = try await self.userRepository.getUserMakFolder(GetUserMakFolderRequest(userId: 1578568449))
                print("getUserMakFolder response \(response)")
                
                if let content = response.result?.makUserTable?.content {
                    makModel = content
                } else {
                    makModel = []
                }
                fetchLoading = true
            } catch {
                Logger.debug(error: error, message: "")
            }
        }
    }
    
    @MainActor
    func updateComment(makSeq: Int, contents: String, isVisible: String) {
        Task { // 비동기처리
            do {
                // do -> 여기서 통신
                let response = try await self.userRepository.updateComment(UpdateCommentRequest(userId: 1578568449,
                                                                                                makNumber: makSeq,
                                                                                                contents: contents,
                                                                                                isVisible: isVisible))
                if response.status == 200 {
                    self.getUserMakFolder()
                }
                
            } catch {
                // error 처리
                Logger.debug(error: error, message: "")
            }
        }
    }
    
    @MainActor
    func deleteComment(makSeq: Int) {
        Task { // 비동기처리
            do {
                // do -> 여기서 통신
                let response = try await self.userRepository.deleteComment(DeleteCommentRequest(userId: 1578568449,
                                                                                                makNumber: makSeq))
                if response.status == 200 {
                    self.getUserMakFolder()
                }
                
            } catch {
                // error 처리
                Logger.debug(error: error, message: "")
            }
        }
    }
    
}
