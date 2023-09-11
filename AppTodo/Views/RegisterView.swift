//
//  RegisterView.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//

import SwiftUI

struct RegisterView: View {

//	@State var fullName: String = ""
//	@State var email: String = ""
//	@State var password: String = ""

	@StateObject var vm = RegisterViewViewModel()

    var body: some View {
		VStack{
			HeaderView(title: "Register", subtitle: "Start organizing tods", angle: -15, background: .orange)

			Form{
				TextField("Full name:", text: $vm.fullName)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocorrectionDisabled()
				TextField("E-mail:", text: $vm.email)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocapitalization(.none)
					.autocorrectionDisabled()
				SecureField("Password:", text: $vm.password)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocorrectionDisabled()
					.autocapitalization(.none)

				TLButton(title: "Create Account", background: .green) {
					//Attempt registration
					vm.register()
				} //end TLButton
				.padding()
			} //end Form
			.offset(y: -50)
			Spacer()
		} //end VStack
    } //end var body
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
