//
//  WelcomeView.swift
//  SwifuiLoginSample
//
//  Created by Marlon Boncodin on 7/12/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.8) // change to any color
                .ignoresSafeArea(.all)
            
            Text("WELCOME!!")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
        }
    }
}

#Preview {
    WelcomeView()
}
