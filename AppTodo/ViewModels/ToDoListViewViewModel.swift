//
//  ToDoListViewViewModel.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//

import FirebaseFirestore
import Foundation

/// ViewModel for list of item views
/// Primary tab
class TodoListViewViewModel: ObservableObject {

	@Published var showingNewItemView = false
	private let userId: String

	init(userId: String){
		self.userId = userId
		
	} //end init()


	/// Delete ToDoListItem
	/// - Parameter id: item id to delete
	func delete(id: String){
		let db = Firestore.firestore()

		db.collection("users")
			.document(userId)
			.collection("todos")
			.document(id)
			.delete()

	}

} //end class ToDoListViewViewModel
