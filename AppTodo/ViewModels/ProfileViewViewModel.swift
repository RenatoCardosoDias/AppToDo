//
//  ProfileViewViewModel.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//

import FirebaseAuth
import FirebaseFirestore

import Foundation

class ProfileViewViewModel: ObservableObject {

	@Published var user: User? = nil

	init() {

	} //end init()

	func fetchUser() {
		guard let userId = Auth.auth().currentUser?.uid else {
			return
		} //end guard let userId
		let db = Firestore.firestore()
		db.collection("users")
			.document(userId)
			.getDocument { [weak self] snapshot, error in
				guard let data = snapshot?.data(), error == nil else {
					return
				} //end guard let data
				DispatchQueue.main.async {
					self?.user = User(id: data["id"] as? String ?? "", fullName: data["fullname"] as? String ?? "", email: data["email"] as? String ?? "", joined: data["joined"] as? TimeInterval ?? 0)
				}
			} //end .getDocument
	} //end func fetchUser

	func logOut(){
		do {
			try Auth.auth().signOut()
		} catch {
			print(error)
		}
		
	} //end func logOut
} //end class ProfileViewViewModel
