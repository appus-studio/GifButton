//
//  GifButton.h
//  testAnimation
//
//  Created by Vlad Kosyi on 5/10/16.
// Copyright (c) 2014 Appus Studio LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE
@interface GifButton : UIButton

/*!
 * @brief Number of repeat Gif animation. Set in Interface Builder.
 */
@property (assign, nonatomic) IBInspectable NSInteger repeatCount;

/*!
 * @brief Number of speed Gif animation. Set in Interface Builder.
 */

@property (assign, nonatomic) IBInspectable double animationDuration;

/*!
 * @brief Name of Gif animation. Set in Interface Builder.
 */

@property (assign, nonatomic) IBInspectable NSString *gifName;


/*!
 * @discussion Func start animate array of images with duration and repeat count.
 */

- (void) startAnimation;

@end
