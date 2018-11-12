//
//  ViewController.swift
//  CoreData-SaveImage
//
//  Created by Trung on 11/8/18.
//  Copyright © 2018 Trung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImage: UIImageView! {
        didSet {
            photoImage.image = UIImage(named: "image1")
        }
    }
    var pictures: [DataImage]?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pictures = try? (AppDelegate.context.fetch(DataImage.fetchRequest())) as [DataImage], !pictures.isEmpty {
          photoImage.image = pictures.last?.image
        }
        
    }
    
    @IBAction func selectImageFromPhotoLabary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // khi nguoi dung chuan bi chon anh ma cancel thi huy luon ham chon anh
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let slectImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
              fatalError("dmm co loi: \(info)")
        }
        photoImage.image = slectImage
        let entity = DataImage(context: AppDelegate.context)
        entity.image = slectImage
        AppDelegate.saveContext()
        dismiss(animated: true, completion: nil)
    }
    
    
    


}


