//
//  TableViewCell.swift
//  Meme
//
//  Created by Tami on 07.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var memeImage: UIImageView!
    
    @IBOutlet private weak var memeTitle: UILabel!
    
    var meme : Memes! {
        
        didSet{
        self.memeTitle.text = meme.name
        self.memeImage.setImage(imgURL: meme.url)
            
        }
    }
    
}
    
 

