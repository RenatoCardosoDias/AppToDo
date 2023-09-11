//
//  NewItemView.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//

import SwiftUI

struct NewItemView: View {

	@StateObject var vm = NewItemViewViewModel()
	@Binding var newItemPresented: Bool 



    var body: some View {
		VStack{
			Text("New item")
				.font(.system(size: 32))
				.bold()
				.padding(.top, 50)

			Form {
				//Title
				TextField("Name", text: $vm.title)
					.textFieldStyle(DefaultTextFieldStyle())
				//Due Data
				DatePicker("Due Date", selection: $vm.dueDate)
					.datePickerStyle(GraphicalDatePickerStyle())

				//Button
				TLButton(title: "Save", background: .pink) {
					//TODO: vm.save
					if vm.canSave {
						vm.save()
						newItemPresented = false
					} else {
						vm.showAlert = true
					} //end if vm.canSave
				} //end TLButton
				.padding()
			} //end Form
			.alert(isPresented: $vm.showAlert) {
				Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer."))
			}
		} //end VStack
    } //end var body
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
		NewItemView(newItemPresented: Binding(get: {
			return true
		}, set: { _ in

		}))
    }
}
