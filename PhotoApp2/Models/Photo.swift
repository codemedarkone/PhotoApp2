//
//  Photos.swift
//  PhotoApp2
//
//  Created by chris  on 8/15/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import Foundation
import Firebase

struct Photo {
    
    var photoId: String?
    var byId: String?
    var byUsername:String?
    var date: String?
    var url: String?
    
    init?(snapshot: DataSnapshot) {
        
        //Photo Data
        let photoData = snapshot.value as? [String: String]
        
        if let photoData = photoData {
            
            let photoId     = snapshot.key
            let byId        = photoData["byId"]
            let byUsername  = photoData["byUsername"]
            let date        = photoData["date"]
            let url         = photoData ["url"]
            
            guard byId != nil && byUsername != nil && date != nil && url != nil else { return nil }
            
            self.photoId = photoId
            self.byId = byId
            self.byUsername = byUsername
            self.date = date
            self.url = url
        }
    }
}
