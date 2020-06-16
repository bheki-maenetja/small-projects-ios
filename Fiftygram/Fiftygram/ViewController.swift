//
//  ViewController.swift
//  Fiftygram
//
//  Created by Bheki Maenetja on 2020/06/15.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let context = CIContext()
    var original: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func choosePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            navigationController?.present(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        navigationController?.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            original = image
        }
    }
    
    @IBAction func applySepia(_ sender: Any) {
        guard let original = original else {
            return
        }
        let filter = CIFilter(name: "CISepiaTone")
        filter?.setValue(0.9, forKey: kCIInputIntensityKey)
        display(filter: filter!)
    }
    
    @IBAction func applyNoir(_ sender: Any) {
        guard let original = original else {
            return
        }
        let filter = CIFilter(name: "CIPhotoEffectNoir")
        display(filter: filter!)
    }
    
    @IBAction func applyVintage(_ sender: Any) {
        guard let original = original else {
            return
        }
        let filter = CIFilter(name: "CIPhotoEffectProcess")
        display(filter: filter!)
    }
    
    func display(filter: CIFilter) {
        filter.setValue(CIImage(image: original!), forKey: kCIInputImageKey)
        let output = filter.outputImage
        imageView.image = UIImage(cgImage: self.context.createCGImage(output!, from: output!.extent)!)
    }
}

