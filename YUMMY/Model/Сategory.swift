//
//  Сategory.swift
//  YUMMY
//
//  Created by Marina on 13.10.22.
//

import UIKit

struct Category: Hashable, Decodable {
    var nameCategory: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id
    }
}
