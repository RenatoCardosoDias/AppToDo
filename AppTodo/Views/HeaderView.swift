//
//  HeaderView.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//

import SwiftUI

struct HeaderView: View {
	var title: String
	var subtitle: String
	let angle: Double
	let background: Color

    var body: some View {
		ZStack{
			RoundedRectangle(cornerRadius: 0)
				.foregroundColor(background)
				.rotationEffect(Angle(degrees: angle))

			VStack{
				Text(title)
					.font(.system(size: 50))
					.foregroundColor(Color.white)
					.bold()
				Text(subtitle)
					.font(.system(size: 30))
					.foregroundColor(Color.white)
			} // VStack
			.padding(.top, 80)
		} //end ZStack
		.frame(width: UIScreen.main.bounds.width * 3, height: 350)
		.offset(y: -150)
    } //end var body
} //end struct

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
		HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: Color.pink)
    }
}
