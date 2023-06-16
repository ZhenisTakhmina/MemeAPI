//
//  Networking.swift
//  Meme
//
//  Created by Tami on 08.03.2023.
//

import Foundation
import Alamofire

struct Networking {
    
    func fetchData(
        onSuccess success: @escaping(MemeResponseModel) -> Void,
        onFailure failure: @escaping(String) -> Void
    ) {
        let url = "https://api.imgflip.com/get_memes"
        AF.request(url).responseDecodable(of: MemeResponseModel.self ) {response in
            switch response.result {
            case.success(let value) :
                success(value)
            case.failure(let error) :
                failure(error.localizedDescription)
            }
        }
    }
}
