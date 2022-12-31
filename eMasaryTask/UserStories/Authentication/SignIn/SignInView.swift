//
//  SignInView.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class SignInView: AuthenticationView {

    private let mainButtonText = "  Sign in  "
    private let switchButtonText = "New user? Sign up"

    override func setupView() {
        super.setupView()
        customizeView()
    }

    private func customizeView() {
        mainButton.setTitle(mainButtonText, for: .normal)
        switchButton.setTitle(switchButtonText, for: .normal)
    }
}
