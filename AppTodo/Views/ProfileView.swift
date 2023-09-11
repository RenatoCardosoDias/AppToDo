//
//  ProfileView.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//

import SwiftUI

struct ProfileView: View {

	@StateObject var vm = ProfileViewViewModel()
	
    var body: some View {
		NavigationView{
			VStack{
				if let user = vm.user {
					profile(user: user)

				} else {
					Text("Loading Profile....")
				} //end if let user = vm.user
			} //end VStack
			.navigationTitle("Profile")
		} //end Navigation
		.onAppear{
			vm.fetchUser()
		} //end .onAppear
    } //end var body


//MARK: - @Viewbuilder
	@ViewBuilder
	func profile(user: User) -> some View {
		Image(systemName: "person.circle")
			.resizable()
			.aspectRatio(contentMode: .fit)
			.foregroundColor(Color.blue)
			.frame(width: 125, height: 125)
			.padding()
		//Info: Name, Email, Member since
		VStack(alignment: .leading) {
			HStack{
				Text("Name: ")
					.bold()
				Text(user.fullName)
			}
			.padding()
			HStack{
				Text("E-mail: ")
					.bold()
				Text(user.email)
			}
			.padding()
			HStack{
				Text("Member Since: ")
					.bold()
				Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
			}
			.padding()
		} //end VStack
		.padding()
		//Sign Out
		Button("Log Out") {
			vm.logOut()
		} //end Button
		.tint(.red)
		Spacer()
	}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
