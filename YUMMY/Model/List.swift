//
//  List.swift
//  YUMMY
//
//  Created by Marina on 13.10.22.
//

import UIKit

struct List: Hashable, Decodable {
    var nameFood: String
    var foodImageString: String
    var consist: String
    var price: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: List, rhs: List) -> Bool {
        return lhs.id == rhs.id
    }
}
