//
//  ToDoListItem.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{
	let id: String
	let title: String
	let dueDate: TimeInterval
	let createDate: TimeInterval
	var isDone: Bool

	//A razao de que nos precisamso disto aqui é uma vez que nos trazemos essa funcionalidade para checar ou não checar se um item está concluído ou não , nós estamos querendo modificar o Model para refletir isso antes de nos salvarmos isso ou atualizar em nosso banco de dados

	mutating func setDone(_ state: Bool){
		isDone = state
	}
}
