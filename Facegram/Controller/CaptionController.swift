//
//  CaptionController.swift
//  Facegram
//
//  Created by Wilson Sumanang on 3/26/16.
//  Copyright © 2016 Wilson Sumanang. All rights reserved.
//

import UIKit

protocol CaptionDelegate {
    func captionController(controller: CaptionController, didFinishWithCaption caption: String)
}


class CaptionController: UIViewController {
    @IBOutlet weak var captionText: UITextView!
    @IBOutlet weak var imagePreview: UIImageView!
    var selectedImage: UIImage!
    var delegate: CaptionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePreview.image = selectedImage
    }
    
    @IBAction func tap(sender: UITapGestureRecognizer!) {
        captionText.resignFirstResponder()
    }
    
    @IBAction func submitPressed(sender: UIButton!) {
        if let captionDelegate = self.delegate {
            captionDelegate.captionController(self, didFinishWithCaption: captionText.text)
        }
        
    }
    
    @IBAction func backPressed(sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
