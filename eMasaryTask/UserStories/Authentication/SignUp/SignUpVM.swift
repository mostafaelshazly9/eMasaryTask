//
//  SignUpVM.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation

class SignUpVM: ObservableObject {

    private let model = SignUpModel()

    @Published var isShowingUsernameEmptyError = false
    @Published var isShowingPasswordEmptyError = false
    @Published var isShowingSignUpError = false
    @Published var isShowingUnexpectedError = false
    @Published var shouldGoToMainScreen = false

    /// Validates that username and password are not empty
    func trySigningUpWith(username: String?, password: String?) {
        guard let username, !username.isEmpty else {
            isShowingUsernameEmptyError = true
            return
        }
        isShowingUsernameEmptyError = false

        guard let password, !password.isEmpty else {
            isShowingPasswordEmptyError = true
            return
        }
        isShowingPasswordEmptyError = false

        signUp(username, password)
    }

    /// Calls the model's  sign in method and stores user's id
    private func signUp(_ username: String, _ password: String) {
        Task {
            do {
                let userId = try await model.trySigningUp(username: username, password: password)
                guard let userId else {
                    isShowingSignUpError = true
                    return
                }

                UserDefaults.standard.set(userId, forKey: "userId")
                shouldGoToMainScreen = true
            } catch {
                isShowingUnexpectedError = true
            }
        }
    }
}
