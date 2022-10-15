//
//  Baners.swift
//  YUMMY
//
//  Created by Marina on 13.10.22.
//

import UIKit

struct Baners: Hashable, Decodable {
   
    var imageStringURL: String
    var nameCategory: String
    var nameFood: String
    var foodImageString: String
    var consist: String
    var price: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Baners, rhs: Baners) -> Bool {
        return lhs.id == rhs.id
    }
}


