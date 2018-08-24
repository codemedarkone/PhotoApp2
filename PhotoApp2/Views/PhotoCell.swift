//
//  PhotoCell.swift
//  PhotoApp2
//
//  Created by chris  on 8/22/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCell: UITableViewCell {
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        return label
    }()
    
    let photoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        
        addSubview(usernameLabel)
        addSubview(photoImage)
        addSubview(dateLabel)
        
       setupViews()
    }
    
    func setupViews() {
        
         usernameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 10, paddingRight: 0, width: 0, height: 0)
        
        photoImage.anchor(top: usernameLabel.bottomAnchor, left: leftAnchor, bottom: dateLabel.topAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 8, paddingRight: 20, width: 0, height: 0)
        
        dateLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPhoto(_ photo: Photo) {
        
        usernameLabel.text = photo.byUsername
        dateLabel.text = photo.date
        
        if let urlString = photo.url {
            
            let url = URL(string: urlString)
            
            guard url != nil else {
                print("couldnt return url object")
                return
            }
            //loads images and caches them for us
            photoImage.sd_setImage(with: url) { (image, err, cacheType, url) in
                
                self.photoImage.image = image
            }
        }
        
    }
        
        
}
