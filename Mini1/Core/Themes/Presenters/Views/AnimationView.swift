//
//  AnimationView.swift
//  Mini1
//
//  Created by Nadya Tyandra on 05/05/23.
//

import SwiftUI

struct animationView: View {
    @EnvironmentObject var viewModel: AnimationViewModel
    @State var index:Int = 1
    let date: Date
    
    var body: some View {
        Image(uiImage: UIImage(named: viewModel.data[viewModel.index].animationImageNames[self.index])!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .onAppear {
                playAnimation()
            }
            .onChange(of: self.date) { _ in
                playAnimation()
            }
    }
    
    func playAnimation() {
        if self.index < viewModel.data[viewModel.index].length - 1 {
            self.index += 1
        } else {
            self.index = 0
        }
    }
}

struct animationView_Previews: PreviewProvider {
    static var previews: some View {
        animationView(date: Date())
            .environmentObject(AnimationViewModel())
    }
}
