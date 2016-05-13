//
//  GifButton.swift
//  KVGifButtonSwift
//
//  Created by Vlad Kosyi on 5/10/16.
//  Copyright © 2016 Vlad Kosyi. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class GifButton : UIButton {
  
  
  /**
   @repeatCount - number of repeat Gif animation. Set in Interface Builder. NON private var
   */
  
  @IBInspectable var repeatCount : Int  = 0 {
    didSet {
      imageView!.animationRepeatCount = repeatCount
    }
  }
  
  /**
   animationDuration - number of speed Gif animation. Set in Interface Builder. NON private var
   */
  
  @IBInspectable var animationDuration : Double = 0.0 {
    didSet {
      imageView!.animationDuration = animationDuration
    }
  }
  
  /**
   gifName - name of Gif animation. Set in Interface Builder. NON private var
   */
  
  @IBInspectable var gifName : NSString = "" {
    didSet {
      updateImagesArray(imagesArray)
    }
  }
  
  /**
   imagesArray - an array of images which sets the user  if there is no whole GIF. NON private var
   */
  
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
  
  /**
   reversedImages - an array of reverse images on second tap button. NON private var
   */
  
  private var reversedImages: [UIImage] = []
  
  /**
   
   Func takes array of images from imagesArray if there is no whole GIF.
   If array nil, func search whole Gif and parce array of images and gif duration.
   If user set gif duration 0 -> gif duration use from parce of Gif
   
   @param imagesArray - Array of images for create Gif.
   */
  func updateImagesArray(imagesArray: [UIImage]) {
    if imagesArray.count == 0 {
      if gifName.length != 0 {
        let url: NSURL =  NSBundle.mainBundle().URLForResource(gifName as String, withExtension: "gif")!
        var dict: [NSObject : AnyObject] = UIImage.animatedImageDictionaryWithAnimatedGIFData(NSData(contentsOfURL:url)!)!
        self.imagesArray = dict["array"] as! [UIImage]
        if animationDuration == 0 {
          imageView!.animationDuration = dict["duration"] as! Double
        }
      }
    }
    else {
      imageView?.animationImages = imagesArray
    }
  }
  
  
  /**
   
   Func start animate array of images with duration and repeat count.
   */
  
  func startAnimation() {
    if imagesArray.count != 0 {
      if ((imageView?.isAnimating) != nil) {
        if !(imageView?.isAnimating())! {
          setImage(imageView?.animationImages?.last, forState: .Normal)
          imageView?.startAnimating()
          performSelector(#selector(GifButton.starAnimationDidFinish), withObject: nil, afterDelay:
            (imageView?.animationDuration)! * Double(imageView!.animationRepeatCount) + 0.1)
          userInteractionEnabled = false
        }
      }
    } else {
      NSLog("Empry array")
    }
  }
  
  
  /**
   
   Func reverse array of images
   */
  
  func starAnimationDidFinish() {
    
    reversedImages = (imageView?.animationImages)!
    reversedImages = reversedImages.reverse()
    imageView?.animationImages = reversedImages
    userInteractionEnabled = true
    
    
  }
}
