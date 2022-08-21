//
//  ImagePicker ext.swift
//  PhotoCheckManager
//
//  Created by Сергей on 21.08.2022.
//

import UIKit

extension ManagerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    
    @objc func clickToImage(){
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Photo Gallery", style: .default, handler: { (button) in
            self.imagepicker.sourceType = .photoLibrary // library
            self.present(self.imagepicker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (button) in
            self.imagepicker.sourceType = .camera // Camera
            self.present(self.imagepicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        let imageView = TextViewTableViewCell().picture
        picture.image = pickedImage
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
