//
//  SignInModel.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

class SignInModel {

    /// Searches the user's collection for a document with the corresponding username and password fields and returns its id if found
    func getUserId(username: String, password: String) async throws -> String? {
        try await withCheckedThrowingContinuation({ continuation in
            FirebaseManager.db
                .collection("users")
                .whereField("username", isEqualTo: username)
                .whereField("password", isEqualTo: password)
                .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    continuation.resume(throwing: err)
                } else {
                    guard let querySnapshot else { return }
                    continuation.resume(returning: querySnapshot.documents.first?.documentID)
                }
            }
        })
    }
}
