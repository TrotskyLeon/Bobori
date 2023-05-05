//
//  AnimationModel.swift
//  Mini1
//
//  Created by Nadya Tyandra on 05/05/23.
//

import Foundation

struct AnimationModel: Hashable, Equatable {
    let animation: String
    let length: Int
    let animationImageNames: [String]
    
    init(animation: String, length: Int) {
        self.animation = animation
        self.length = length
        self.animationImageNames = (0...length).map({"\(animation)-\($0)"})
    }
}
