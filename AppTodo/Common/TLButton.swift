//
//  TLButton.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//

import SwiftUI

struct TLButton: View {

	@State var title: String
	@State var background: Color
	let action: () -> Void

    var body: some View {
		Button {
			action()
		} label: {
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor(background)
				Text(title)
					.foregroundColor(Color.white)
					.bold()
			} //end ZStack
		} //end Button
		.padding()
    } //end var body
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
		TLButton(title: "Login", background: .yellow) {
			//Action
		}

    }
}

