//
//  AuthenticationErrorLabel.swift
//  eMasaryTask
//
//  Created by Mostafa Elshazly on 31/12/2022.
//

import Foundation
import UIKit

class AuthenticationErrorLabel: UILabel {

    init() {
        super.init(frame: .zero)
        isHidden = true
        textColor = .red
        font = .preferredFont(forTextStyle: .footnote)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
