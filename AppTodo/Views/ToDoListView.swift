//
//  ToDoListView.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//
import FirebaseFirestoreSwift

import SwiftUI

struct ToDoListView: View {

	@StateObject var vm : TodoListViewViewModel
	@FirestoreQuery var items : [ToDoListItem]

//	private let userId: String

	init(userId: String ){
		//nos precisamos inicialar isso pq firestore, nosso banco de dados, tem uma propriedade util com alguma funcionalidades, onde nos podemos na verdade dizer , hey, observador, todas as entradas no banco de dados em um caminho específico , quando quero dizer caminho quero dizer

		//users/<id>/todos/<entradas> - numero de itens da lista de tarefas

		//esse id de usuário específico para quem queremos obter os itens
//		self.userId = userId
		//users/<id>/todos/<entradas>
		self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
		self._vm = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
	}

	
    var body: some View {
		NavigationView{
			VStack{
				List(items){ item in
					ToDoListItemsView(item: item)
						.swipeActions {
							Button{
								//delete
								vm.delete(id: item.id)
							} label: {
								Text("Delete")
							} //end Button
							.tint(Color.red)
						} //end .swipeActions
				} //end List
				.listStyle(PlainListStyle())

			} //end VStack
			.navigationTitle("To Do List")
			.toolbar {
				Button{
					vm.showingNewItemView = true
				} label: {
					Image(systemName: "plus")
				} //end Button
			} //end .toolbar
			.sheet(isPresented: $vm.showingNewItemView) {
				NewItemView(newItemPresented: $vm.showingNewItemView)
			}
		} //NavigationView
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
		ToDoListView(userId: "l8NR1RSbUdMbazLfCMNGTp1edhS2")
    }
}
