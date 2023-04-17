//
//  AlertPhotoCamera.swift
//  Carhelper
//
//  Created by Vladislav  Staryk on 08.02.2023.
//

import UIKit

extension UIViewController {
    
    func alertPhotoOrCamera(complitionHandler: @escaping (UIImagePickerController.SourceType) -> Void) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            let camera = UIImagePickerController.SourceType.camera
            complitionHandler(camera)
        }
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) { _ in
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            complitionHandler(photoLibrary)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
}

