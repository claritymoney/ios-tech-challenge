//
//  Helpers.swift
//  TechChallenge
//
//  Created by Zeeshan Mian on 10/17/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import SwiftUI

struct ViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) { }
}
