//
//  ToDoListItemViewViewModel.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

///ViewModel for single to do list item (each row in items list)
///

class ToDoListItemViewViewModel: ObservableObject {

	init() {
		
	} //end init

	func toggleIsDone(item: ToDoListItem) {
		var itemCopy = item
		itemCopy.setDone(!item.isDone)

		//Precisamos atualizar no nosso banco de dados essas alteração

		//vamos obter o id do usuario atual
		guard let uid = Auth.auth().currentUser?.uid else {
			return
		}

		//Savar no bano de dados
		let db = Firestore.firestore()
		db.collection("users")
			.document(uid)
			.collection("todos")
			.document(itemCopy.id)
			.setData(itemCopy.asDictionary())

	} //end func toggleIsDone
} //end class ToDoList
