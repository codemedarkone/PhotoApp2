//
//  PhotoService.swift
//  PhotoApp2
//
//  Created by chris  on 8/15/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth

class PhotoService {
    
    static func getPhotos(completion: @escaping ([Photo]) -> Void) -> Void{
        
        //Get a reference to the database
        let dbRef = Database.database().reference()
        
        //Make the db call
        dbRef.child("photos").observe(.value) { (snapshot) in
            
            var retrievedPhotos = [Photo]()
            
            //get a list of snapshots
            let snapshots = snapshot.children.allObjects as? [DataSnapshot]
            
            if let snapshots = snapshots {
                
                for snap in snapshots {
                    
                    //try to createa  photo from a snapshot
                    let p = Photo(snapshot: snap)
                    
                    // If successful, add it to our array
                    if p != nil {
                        retrievedPhotos.insert(p!, at: 0)
                    }
                }
            }
            
            //after parsing the snapshots, call the completion closure
            completion(retrievedPhotos)
        }
    }
    
    static func savePhoto(image: UIImage) {
        
        //get data represetnation of the image
        let photoData = UIImageJPEGRepresentation(image, 0.1)
        
        guard photoData != nil else {
            print("Couldnt turn the image into data")
            return
        }
        
        //get the storage reference
        let userid = Auth.auth().currentUser?.uid
        let fileName = UUID().uuidString
        
        let ref = Storage.storage().reference().child("images/\(userid)\(fileName).jpg")
        
        //upload the photo
        ref.putData(photoData!, metadata: nil) { (metadata, error) in
            
            if error != nil {
                print("An error occured uploading image")
            }
            else {
                //upload was successful, now create a database entry
                self.createPhotoDatabaseEntry(ref: ref)
            }
        }
    }
    
    private static func createPhotoDatabaseEntry(ref:StorageReference) {
        
        //get download url for photo
        ref.downloadURL { (url, error) in
            
            if error != nil {
                print("couldnt retreive the url!")
                return
            }
            else {
                // get the metadata for the db entry
                
                //get user
                let user = LocalStorageService.loadCurrentUser()
                
                guard user != nil else { return }
                
                // get the date
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .full
                
                let dateString = dateFormatter.string(from: Date())
                
                // Create photo data
                let photoData = ["byId": user!.userId, "byUsername": user!.username, "date": dateString, "url": url!.absoluteString]
                
                //write a database entry
                let dbRef = Database.database().reference().child("photos").childByAutoId()
                dbRef.setValue(photoData, withCompletionBlock: { (error, dbRef) in
                    
                    if error != nil {
                        print("there was an error writing to database entry")
                        return
                    }
                    else {
                        //Database entry for the photo was written
                    }
                })
            }
        }
    }
}
