//
//  AuthenticationTextField.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class AuthenticationTextField: UITextField {

    init() {
        super.init(frame: .zero)
        textAlignment = .center
        layer.cornerRadius = 8
        layer.borderWidth = 1
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
