//
//  RegisterViewViewModel.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {

	@Published var fullName: String = ""
	@Published var email: String = ""
	@Published var password: String = ""

	init() {

	} //end init()

	func register() {
		guard validate() else {
			return
		} //end guard validate

		//Create a user on Firebase

		Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
			guard let userId = result?.user.uid else {
				//Podemos devolver uma msg de sucesso
				return
			} //end Auth.auth()

			self?.insertUserRecord(id: userId)

		} //end Auth
	} //end func register


	private func insertUserRecord (id: String) {
		let newUser = User(id: id, fullName: fullName, email: email, joined: Date().timeIntervalSince1970)

		let db = Firestore.firestore()

		//criando uma coleção de usuários
		db.collection("users")
			.document(id)
			.setData(newUser.asDictionary())

	} //end private func insertUserRecord

	private func validate() -> Bool {
		guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty , !password.trimmingCharacters(in: .whitespaces).isEmpty  else {


			return false
		}

		guard email.contains("@") && email.contains(".") else {
			return false
		}

		guard password.count >= 6 else {

			return false
		}

		return true
	} //end private func validate
	
} //end class RegisterViewViewModel
