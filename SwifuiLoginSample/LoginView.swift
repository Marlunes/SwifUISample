//
//  LoginView.swift
//  SwifuiLoginSample
//
//  Created by Marlon Boncodin on 7/12/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.white // change to any color
                .ignoresSafeArea(.all)
            
            NavigationStack {
                MainBodyView()
                
                NavigationLink(destination: WelcomeView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true),
                               isActive: $viewModel.showSuccessLogin) { EmptyView() }
            }
            
            if viewModel.showLoader {
                LoaderView()
            }
        }
    }
    
    
    private func MainBodyView() -> some View {
        VStack(spacing: 16) {
           
            VStack(spacing: 0) {
                Text("Username")
                    .font(Font.system(size: 15))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField("Email", text: $viewModel.emailInput)
                    .font(Font.system(size: 12))
                    .foregroundColor(.black)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 1)
                            .frame(height: 35)
                    )
                
                Text(viewModel.emailErrorMessage)
                    .font(.footnote)
                    .foregroundColor(.red)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            
            VStack(spacing: 0) {
                Text("Password")
                    .font(Font.system(size: 15))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                SecureField("Password", text: $viewModel.passwordInput)
                    .font(Font.system(size: 12))
                    .foregroundColor(.black)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 1)
                            .frame(height: 35)
                    )
            }
            
            Button {
                //call your api here
                viewModel.login()
            } label: {
                Text("Sign In")
                    .foregroundColor(.white)
                    .font(Font.system(size: 18))
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(viewModel.buttonBackgroundColor)
            }
            .padding(.horizontal, 24)
            .disabled(!viewModel.shoudProceed)
            
        }
        .padding()
    }
    
}

#Preview {
    LoginView()
}
