//
//  NewItemViewViewModel.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//
import FirebaseAuth
import FirebaseFirestore //também conhecido como nosso Database

import Foundation

class NewItemViewViewModel: ObservableObject{

	@Published var title: String = ""
	@Published var dueDate = Date()
	@Published var showAlert = false
	

	init() {

	} //end init()

	func save() {
		//fazer mais uma verificação de checagem
		guard canSave else {
			return
		}

		//criar uma nova instância do nosso ToDoListItemModel


		//vamos obter o ID do usuario atual
		guard let uId = Auth.auth().currentUser?.uid else {
			return
		}
		//Craete Model
		let newId = UUID().uuidString
		let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false)


		//Save Model

		//Criando uma instancia do Banco
		let db = Firestore.firestore()

		//através da instancia do banco, vamos chamar a colecção de users, selecionar o usuario pelo ID e criar uma coleção de tarefas chamada todos, e criando um novo documento chamado 123 e vamos setar os dados atavés do dicinário que criamos que seria o titulo e a data
		db.collection("users")
			.document(uId)
			.collection("todos")
			.document(newId)
			.setData(newItem.asDictionary())



		//basicamente vamos criar uma sub coleção no usuario atual

	} //end func save
	var canSave: Bool{
		guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
			return false
		}
		guard dueDate >= Date().addingTimeInterval(-86400) else {
			return false
		}

		return true
	} //end var canSave
}
