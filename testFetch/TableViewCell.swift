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
    
    
    var arrayOfImages:String?
    
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
                    arrayOfImages = (urlString as! String)
                }
            }
        }
        imageOutlet?.downloadImage(from: arrayOfImages!)

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



let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func downloadImage(from url: String) {
        image = nil
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        let urlRequest = URLRequest (url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            DispatchQueue.main.async {
                var imageToCache = UIImage(data: data!)
                if imageToCache == nil {
                    let imageName = "viseci.jpg"
                    imageToCache = UIImage(named: imageName)
                    imageCache.setObject(imageToCache!, forKey: url as AnyObject)
                    self.image = imageToCache
                    print(error as Any)
                    return
                }
                imageCache.setObject(imageToCache!, forKey: url as AnyObject)
                self.image = imageToCache
            }
        }
        task.resume()
    }
}
