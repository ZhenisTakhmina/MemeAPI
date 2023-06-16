//
//  MemeResponseModel.swift
//  Meme
//
//  Created by Tami on 08.03.2023.
//

import Foundation

struct MemeResponseModel : Decodable {
    let data : DataModel
}

struct DataModel: Decodable {
    let memes: [Memes]
}

struct Memes : Decodable {
    let id : String
    let name : String
    let url : String
}
