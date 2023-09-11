//
//  User.swift
//  AppTodo
//
//  Created by Renato on 01/09/23.
//

import Foundation

struct User: Codable {
	let id: String
	let fullName: String
	let email: String
	let joined: TimeInterval
} //end struct User

