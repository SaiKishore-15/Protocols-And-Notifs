//
//  Data.swift
//  Protocols And Notifs
//
//  Created by Sai Kishore on 13/04/21.
//

import Foundation
import UIKit


struct Person {
    var name: String
    var age: Int
    var color: UIColor
    var height: Float
    var dictionary : [String: Any] {
        return ["name": name,"age": age,"color": color,"height": height]
    }
}

class People {
    static let instance = People()
    
    var people = [Person]()
    
    let saiKishore = Person(name: "Sai Kishore", age: 23, color: .red, height: 184)
    let rupakVignesh = Person(name: "Rupak Vignesh", age: 27, color: .brown, height: 180)
    let sabitha = Person(name: "Sabitha", age: 51, color: .blue, height: 167)
    let swaminathan = Person(name: "Swaminathan", age: 57, color: .yellow, height: 173)

    init() {
        self.people = [saiKishore,rupakVignesh,sabitha,swaminathan]
    }
}
