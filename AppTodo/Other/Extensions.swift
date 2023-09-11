//
//  Extensions.swift
//  AppTodo
//
//  Created by Renato on 04/09/23.
//

import Foundation


extension Encodable {
	func asDictionary() -> [String: Any] {
		guard let data =  try? JSONEncoder().encode(self) else  {
			return [:]
		} //end guard let

		//com os dados em mãos vamos tentar codifica-los

		do {
			let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
			return json ?? [:]
		} catch {
			return [:]
		}
	} //end func asDictionary
} //end extension Encodable
