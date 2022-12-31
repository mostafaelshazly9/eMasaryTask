//
//  FirebaseManager.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FirebaseManager {

    static let db = Firestore.firestore()

    static func configureFirebase() {
        FirebaseApp.configure()
    }
}
