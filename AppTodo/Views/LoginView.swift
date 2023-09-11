//
//  LoginView.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//

import SwiftUI

struct LoginView: View {

//	@State var email = ""
//	@State var password = ""
	@StateObject var vm = LoginViewViewModel()

    var body: some View {
		NavigationView {
			VStack{
				//Header
				HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)

				//Login Form
				Form {
					if !vm.errorMessage.isEmpty {
						Text(vm.errorMessage)
							.foregroundColor(Color.red)
					}
						TextField("E-mail", text: $vm.email)
							.textFieldStyle(RoundedBorderTextFieldStyle())
							.autocorrectionDisabled()
							.autocapitalization(.none)
						SecureField("Password", text: $vm.password)
							.textFieldStyle(RoundedBorderTextFieldStyle())
							.autocapitalization(.none)
							.autocorrectionDisabled()

					TLButton(title: "Log In", background: .blue, action: {
						//Action
						vm.login()
					})
				} //end form
				.offset(y: -50)
				//Create Account
				VStack{
					Text("New around here?")
					NavigationLink("Create An Account", destination: RegisterView())
				} //end VStack
				.padding(.bottom, 50)
				Spacer()
			} //end VStack
		}
    } //end var body
} //end struct LoginView

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
