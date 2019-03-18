//
//  TableViewCell.swift
//  testFetch
//
//  Created by ognjen on 3/10/19.
//  Copyright © 2019 ognjen. All rights reserved.
//

import UIKit
import Apollo

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var tagOutlet: UILabel!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var introOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    
    
    
    
    func configure(with post: ViewControllerQuery.Data.Node) {
        
        titleOutlet?.text = post.title
        
        tagOutlet.layer.borderWidth = 2
        tagOutlet.layer.borderColor = UIColor.black.cgColor
        for tag in post.tags! {
            
            tagOutlet?.text = tag?.name?.uppercased()
        }
        introOutlet?.text = post.additionalFields?.asTypeReview?.intro
        
        for image in post.elements! {
            if let dict = image?.data!["file"] as? [String: Any] {
                if let urlString = dict["url"] {
                    let url = URL(string: urlString as! String)
                    let data = try? Data(contentsOf: url!)
                    let image = UIImage(data: data!)
                    imageOutlet?.image = image
                }
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
