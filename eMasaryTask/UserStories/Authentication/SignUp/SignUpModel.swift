//
//  SignUpModel.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

class SignUpModel {

    /// Ensures current username is unique, creates user and returns their id
    func trySigningUp(username: String, password: String) async throws -> String? {
        try await withCheckedThrowingContinuation({ continuation in
            FirebaseManager.db
                .collection("users")
                .whereField("username", isEqualTo: username)
                .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    continuation.resume(throwing: err)
                } else {
                    guard let querySnapshot, querySnapshot.documents.isEmpty else {
                        continuation.resume(returning: nil)
                        return
                    }
                    Task {
                        do {
                            let userId = try await self.signUp(username: username, password: password)
                            continuation.resume(returning: userId)
                        } catch let error {
                            continuation.resume(throwing: error)
                        }
                    }
                }
            }
        })
    }

    /// Create user
    private func signUp(username: String, password: String) async throws -> String? {
        try await withCheckedThrowingContinuation({ continuation in
            let ref = FirebaseManager.db
                .collection("users")
                .addDocument(data: [
                    "username": username,
                    "password": password
                ]) { err in
                    if let err = err {
                        continuation.resume(throwing: err)
                        return
                    }
                }
            continuation.resume(returning: ref.documentID)
        })
    }
}
