//
//  SlideViewController.swift
//  SlideshowApp
//

//

import UIKit

class SlideViewController: UIViewController {
    var imageName: String?

    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imageName = imageName else { return }
        imageView.image = UIImage(named: imageName)
    }

}

