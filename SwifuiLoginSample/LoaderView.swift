//
//  LoaderView.swift
//  SwifuiLoginSample
//
//  Created by Marlon Boncodin on 7/12/24.
//

import SwiftUI

import SwiftUI

struct LoaderView: View {
    
    @State var backgroundOpacity = 0.8
    @State var loadingText = "Loading"
    @State var loadingTextColor = Color.white

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(backgroundOpacity))
                .ignoresSafeArea()
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
            
            ProgressView {
                Text("\(loadingText)")
                    .foregroundColor(loadingTextColor)
                    .font(.system(size: 16))
            }.tint(loadingTextColor)
             .accentColor(.white)
        }
    }
}

#Preview {
    LoaderView()
}
