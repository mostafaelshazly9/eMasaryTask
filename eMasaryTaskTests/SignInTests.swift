//
//  SignInTests.swift
//  eMasaryTaskTests
//
//  Created by Mostafa Elshazly on 31/12/2022.
//


import XCTest
@testable import eMasaryTask

final class SignInTests: XCTestCase {

    func testErrorIsShownWithEmptyUsername() {
        // given
        let sut = SignInVM()

        // when
        sut.trySigningInWith(username: "", password: "123")

        // then
        XCTAssertTrue(sut.isShowingUsernameEmptyError)
    }

    func testErrorIsShownWithEmptyPassword() {
        // given
        let sut = SignInVM()

        // when
        sut.trySigningInWith(username: "123", password: "")

        // then
        XCTAssertTrue(sut.isShowingPasswordEmptyError)
    }
}
