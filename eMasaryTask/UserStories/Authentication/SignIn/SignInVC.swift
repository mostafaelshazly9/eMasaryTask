//
//  SignInVC.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class SignInVC: BaseVC {

    private let contentView = SignInView()
    private let viewModel = SignInVM()

    override func loadView() {
        view = contentView
    }

    override func setupBindings() {
        contentView.delegate = self
        setupBindingsForEmptyUsernameError()
        setupBindingsForEmptyPasswordError()
        setupBindingsForInvalidCredentialsError()
        setupBindingsForShowingUnexpectedError()
        setupBindingsForGoingToMainScreen()
    }

    private func setupBindingsForEmptyUsernameError() {
        viewModel.$isShowingUsernameEmptyError
            .receive(on: DispatchQueue.main)
            .sink { [weak self] shouldShow in
                if shouldShow {
                    self?.contentView.showUsernameEmptyError()
                } else {
                    self?.contentView.hideUsernameEmptyError()
                }
            }.store(in: &cancellables)
    }

    private func setupBindingsForEmptyPasswordError() {
        viewModel.$isShowingPasswordEmptyError
            .receive(on: DispatchQueue.main)
            .sink { [weak self] shouldShow in
                if shouldShow {
                    self?.contentView.showPasswordEmptyError()
                } else {
                    self?.contentView.hidePasswordEmptyError()
                }
            }.store(in: &cancellables)
    }

    private func setupBindingsForInvalidCredentialsError() {
        viewModel.$isShowingInvalidCredentialsError
            .receive(on: DispatchQueue.main)
            .sink { [weak self] shouldShow in
                if shouldShow {
                    self?.showError(message: "InvalidCredentials. Please check again")
                    self?.viewModel.isShowingInvalidCredentialsError = false
                }
            }.store(in: &cancellables)
    }

    private func setupBindingsForShowingUnexpectedError() {
        viewModel.$isShowingUnexpectedError
            .receive(on: DispatchQueue.main)
            .sink { [weak self] shouldShow in
                if shouldShow {
                    self?.showError(message: "Unexpected Error")
                    self?.viewModel.isShowingUnexpectedError = false
                }
            }.store(in: &cancellables)
    }

    private func setupBindingsForGoingToMainScreen() {
        viewModel.$shouldGoToMainScreen
            .receive(on: DispatchQueue.main)
            .sink { [weak self] shouldShow in
                if shouldShow {
                    let viewController = MainTasksVC()
                    viewController.modalPresentationStyle = .fullScreen
                    self?.navigationController?.present(viewController, animated: true)
                    self?.viewModel.shouldGoToMainScreen = false
                }
            }.store(in: &cancellables)

    }
}

extension SignInVC: AuthenticationViewDelegate {

    func didTapMainButton() {
        viewModel.trySigningInWith(username: contentView.usernameTextField.text,
                                   password: contentView.passwordTextField.text)
    }

    func didTapSwitchButton() {
        let viewController = SignUpVC()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
