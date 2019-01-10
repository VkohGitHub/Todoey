//
//  Item.swift
//  Todoey
//
//  Created by Vincent Koh on 1/4/19.
//  Copyright © 2019 Vincent Koh. All rights reserved.
//

import Foundation

//class Item : Encodable, Decodable {
class Item : Codable {
    var title : String = ""
    var done : Bool = false
    
}
