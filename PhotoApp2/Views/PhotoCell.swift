//
//  PhotoCell.swift
//  PhotoApp2
//
//  Created by chris  on 8/22/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit

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
        
        photoImage.anchor(top: usernameLabel.bottomAnchor, left: leftAnchor, bottom: dateLabel.topAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 0)
        
        dateLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPhoto(_ photo: Photo) {
        
        usernameLabel.text = photo.byUsername
        dateLabel.text = photo.date
        
        // Download photo and set the imageView
        
//        guard let url = URL(string: photo.url!) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//
//            if let err = err {
//                print("failed to get url data:", err)
//                return
//            }
//
//            guard let imageData = data else { return }
//            let photoImage = UIImage(data: data!)
//
//            DispatchQueue.main.async {
//                self.photoImage.image = photoImage
//            }
//
//        }
        
        let stringUrl = photo.url
        
        if stringUrl != stringUrl {
            print("no url for image")
            return
        }
        
        let url = URL(string: stringUrl!)
        
        if url != url {
            print("There was no image url")
            return
        }

        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            
            if let err = err {
                print("failed to fetch image:", err)
            }
            
            guard let imageData = data else { return }
            
            let photoImage = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                
                self.photoImage.image = photoImage
            }
        }.resume()
        
    }
}
