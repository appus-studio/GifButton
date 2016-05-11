//
//  ViewController.swift
//  KVGifButtonSwift
//
//  Created by Vlad Kosyi on 5/10/16.
//  Copyright © 2016 Vlad Kosyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageArray: [UIImage] = []
    @IBOutlet weak var gifButton: GifButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageArray = [UIImage]()
      
      for i in 0 ..< 39 {
        self.imageArray.append(UIImage(named: "\(i)")!)
      }

        gifButton.imagesArray.appendContentsOf(imageArray)
        gifButton.repeatCount = 1
        gifButton.animationDuration = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func gifImageAction(sender: AnyObject) {
        gifButton.startAnimation()
    }

}

