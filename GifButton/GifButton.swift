//
//  GifButton.swift
//  KVGifButtonSwift
//
//  Created by Vlad Kosyi on 5/10/16.
//  Copyright © 2016 Vlad Kosyi. All rights reserved.
//

import Foundation
import UIKit

class GifButton : UIButton {
  
  
    private var _repeatCount : Int = 0
    var repeatCount: Int {
        set (newValue) {
            _repeatCount = newValue
            imageView!.animationRepeatCount = _repeatCount
        }
        get {
            return _repeatCount
        }
    }

    private var _animationDuration : Double = 0
    var animationDuration: Double {
        set (newValue) {
            _animationDuration = newValue
            imageView!.animationDuration = _animationDuration
        }
        get {
            return _animationDuration
        }
    }
    private var _imagesArray : [UIImage] = []
    var imagesArray: [UIImage] {
        set (newValue) {
            _imagesArray = newValue
            updateImagesArray(newValue)
        }
        get {
            return _imagesArray
        }
    }
    var reversedImages: [UIImage] = []
    
    func updateImagesArray(imagesArray: [UIImage]) {
        
        imageView?.animationImages = imagesArray
        setBackgroundImage(imagesArray.first, forState: .Normal)
        
    }
        
    func startAnimation() {

        setImage(imagesArray.first, forState: .Normal)
        imageView?.image = imagesArray[0]
        if !(imageView?.isAnimating())! {
            imageView?.startAnimating()
            setBackgroundImage(imageView?.animationImages?.last, forState: .Normal)
            performSelector(#selector(GifButton.starAnimationDidFinish), withObject: nil, afterDelay: (imageView?.animationDuration)!)
            userInteractionEnabled = false
        }
    }
    
    func starAnimationDidFinish() {
        
        reversedImages = (imageView?.animationImages)!
        reversedImages = reversedImages.reverse()
        imageView?.animationImages = reversedImages
        userInteractionEnabled = true
        
        
    }
}
