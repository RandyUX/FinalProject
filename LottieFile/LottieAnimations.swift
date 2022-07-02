//
//  LottieAnimations.swift
//  Project
//
//  Created by Randy on 27/06/22.
//

import Foundation
import SwiftUI
import Lottie

private var animationView: AnimationView?
struct LottieAnimations: UIViewRepresentable {
    let lottieFile: String
    let animationView = AnimationView()
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFill
        animationView.play()

        view.addSubview(animationView)

        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

}
