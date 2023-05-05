//
//  AnimationViewModel.swift
//  Mini1
//
//  Created by Nadya Tyandra on 05/05/23.
//

import Foundation

class AnimationViewModel: ObservableObject {
    @Published var index: Int = 0
    @Published var data: [AnimationModel] = [
        AnimationModel(animation: "dua", length: 29)

    ]
}
