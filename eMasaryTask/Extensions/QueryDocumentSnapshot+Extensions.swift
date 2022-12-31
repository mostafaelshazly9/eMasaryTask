//
//  QueryDocumentSnapshot+Extensions.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import FirebaseFirestore

extension QueryDocumentSnapshot {

    func prepareForDecoding() -> [String: Any] {
        var data = self.data()
        data["documentId"] = self.documentID

        return data
    }
}

extension JSONDecoder {
    func decode<T>(_ type: T.Type, fromJSONObject object: Any) throws -> T where T: Decodable {
        return try decode(T.self, from: try JSONSerialization.data(withJSONObject: object, options: []))
    }
}
