//
//  MainViewViewModel.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//
import FirebaseAuth
import Foundation


class MainViewViewModel: ObservableObject {
	@Published var currentUserId: String = ""
	private var handler: AuthStateDidChangeListenerHandle?

	init() {
		self.handler = Auth.auth().addStateDidChangeListener { [weak self ] _, user in
			DispatchQueue.main.async {
				self?.currentUserId = user?.uid ?? ""
			}
		} //end let handler
	} //end init()

	public var isSignedIn: Bool {
		return Auth.auth().currentUser != nil
	} //end public var isSignedIn

}
