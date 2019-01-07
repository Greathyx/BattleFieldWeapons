//
//  Weapon.swift
//  HelloWorld
//
//  Created by 黄小白 on 2019/1/5.
//  Copyright © 2019 Sherley Huang's studio. All rights reserved.
//

struct Weapon: Codable {
    
    var name = ""
    var type = ""
    var origin = ""
    var image = ""
    var favorite = false
    
    // 子弹类型
    var bullet = 0.0
    // 射击速度
    var mv = 0
    // 整体介绍
    var text = ""
    var rating = ""
    
    init(name: String, type: String, origin: String, image: String, favorite: Bool, bullet: Double, mv: Int, text: String) {
        self.name = name
        self.type = type
        self.origin = origin
        self.image = image
        self.favorite = favorite
        self.bullet = bullet
        self.mv = mv
        self.text = text
    }
}


struct WeaponSpecs: Codable {
    
    var types = [String]()
    var bullets = [Double]()
    
}


struct Origin: Codable {
    
    var continent = ""
    var countries = [String]()
    
}
