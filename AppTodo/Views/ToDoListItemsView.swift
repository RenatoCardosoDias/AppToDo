//
//  ToDoListItemsView.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//

import SwiftUI

struct ToDoListItemsView: View {

	@StateObject var vm = ToDoListItemViewViewModel()
	let item: ToDoListItem

    var body: some View {
		HStack{
			VStack (alignment: .leading){
				Text(item.title)
					.font(.body)

				Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened)) ")
					.font(.footnote)
					.foregroundColor(Color(.secondaryLabel))
			} //end VStack
			Spacer()

			Button {
				vm.toggleIsDone(item: item)
			} label: {
				Image(systemName: item.isDone ? "checkmark.circle.fill": "circle")
					.foregroundColor(Color.blue)
			}
		} //end HStack
    } //end var body
} //end

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
		ToDoListItemsView(item: .init(id: "123", title: "Get Milk", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: true))
    }
}
