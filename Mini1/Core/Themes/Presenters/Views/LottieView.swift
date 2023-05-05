//
//  LottieView.swift
//  Mini1
//
//  Created by Nadya Tyandra on 05/05/23.
//

import SwiftUI
import Foundation
import UIKit
import Lottie


struct LottieView: UIViewRepresentable{
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}

    var name: String
    var loopMode: LottieLoopMode = .playOnce
    var animationView = LottieAnimationView()

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        animationView.animation = LottieAnimation.named(name)

        animationView.contentMode = .scaleAspectFit

        animationView.loopMode = loopMode

        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }
}
