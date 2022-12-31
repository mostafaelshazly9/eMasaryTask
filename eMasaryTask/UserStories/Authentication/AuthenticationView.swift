//
//  AuthenticationView.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class AuthenticationView: BaseView {

    private let usernameTextField = AuthenticationTextField()
    private let passwordTextField = AuthenticationTextField()
    private let mainButton = UIButton()
    private let switchButton = UIButton()

    private let usernameTextFieldPlaceHolder = "Username"
    private let passwordTextFieldPlaceHolder = "Password"
    private let mainButtonText = "  Sign in  "
    private let switchButtonText = "New user? Sign up"

    override func setupView() {
        super.setupView()
        setupUsernameTextField()
        setupPasswordTextField()
        setupMainButton()
        setupSwitchButton()
    }

    private func setupUsernameTextField() {
        usernameTextField.placeholder = usernameTextFieldPlaceHolder

        addSubview(usernameTextField)
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        usernameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupPasswordTextField() {
        passwordTextField.placeholder = passwordTextFieldPlaceHolder
        passwordTextField.isSecureTextEntry = true

        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 40).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupMainButton() {
        mainButton.setTitle(mainButtonText, for: .normal)
        mainButton.backgroundColor = .tintColor
        mainButton.layer.cornerRadius = 8

        addSubview(mainButton)
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40).isActive = true
    }

    private func setupSwitchButton() {
        switchButton.setTitle(switchButtonText, for: .normal)
        switchButton.setTitleColor(.tintColor, for: .normal)

        addSubview(switchButton)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        switchButton.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 20).isActive = true
    }
}
