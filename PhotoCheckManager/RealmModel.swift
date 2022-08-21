//
//  RealmModel.swift
//  PhotoCheckManager
//
//  Created by Сергей on 21.08.2022.
//

import RealmSwift

class Item: Object{
    
    @objc dynamic var name : String = ""
}
class Image: NSData{
    
    @objc dynamic var img : Data?
}

