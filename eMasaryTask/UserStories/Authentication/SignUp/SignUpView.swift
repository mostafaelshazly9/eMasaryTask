//
//  SignUpView.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class SignUpView: AuthenticationView {

    private let mainButtonText = "  Sign up  "
    private let switchButtonText = "Already an existing user? Sign in"

    override func setupView() {
        super.setupView()
        customizeView()
    }

    private func customizeView() {
        mainButton.setTitle(mainButtonText, for: .normal)
        switchButton.setTitle(switchButtonText, for: .normal)
    }
}
