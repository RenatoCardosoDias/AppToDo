//
//  LoginViewViewModel.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {

	@Published var email: String = ""
	@Published var password: String = ""
	@Published var errorMessage: String = ""


	init () {

	}

	func login (){
		guard validate() else {
			return
		} //end guard validate

		//Try log in
		Auth.auth().signIn(withEmail: email, password: password)

		} //end func login

	private func validate() -> Bool {
		errorMessage = ""
		guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {

			errorMessage = "Please fill in all fields"
			return false
		}

		guard email.contains("@") && email.contains(".") else {
			errorMessage = "Please enter valid e-mail"
			return false
		}
		return true
	} //end func validate


} //end Class
