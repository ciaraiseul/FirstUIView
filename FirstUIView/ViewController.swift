//
//  ViewController.swift
//  FirstUIView
//
//  Created by Phạm Trường Giang on 06/08/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var capturedImageView: UIImageView!
    override func viewDidLoad() {
           super.viewDidLoad()
       }

       @IBAction func captureLeftView(_ sender: UITapGestureRecognizer) {
           if let image = captureView(view: leftView) {
               capturedImageView.image = image
           }
       }

       @IBAction func captureRightView(_ sender: UITapGestureRecognizer) {
           if let image = captureView(view: rightView) {
               capturedImageView.image = image
           }
       }

       func captureView(view: UIView) -> UIImage? {
           UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
           defer { UIGraphicsEndImageContext() }
           if let context = UIGraphicsGetCurrentContext() {
               view.layer.render(in: context)
               let image = UIGraphicsGetImageFromCurrentImageContext()
               return image
           }
           return nil
       }

}

