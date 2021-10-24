//
//  UserDetailViewController.swift
//  IesbSocialUikit
//
//  Created by Wesley Marra on 23/10/21.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    var user: User?
    var imagePicker: ImagePicker!
        
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func showImagePicker(_ sender: UIBarButtonItem) {
        self.imagePicker.present(from: sender)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let user = user {
            navigationItem.title = user.name
        }
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
}

extension UserDetailViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}
