//
//  GifButton.h
//  testAnimation
//
//  Created by Vlad Kosyi on 5/10/16.
//  Copyright © 2016 Vlad Kosyi. All rights reserved.
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE
@interface GifButton : UIButton

@property (assign, nonatomic) IBInspectable NSInteger repeatCount;
@property (assign, nonatomic) IBInspectable double animationDuration;
@property (assign, nonatomic) IBInspectable NSString *gifName;
@property (strong, nonatomic) NSArray *imagesArray;
@property (strong, nonatomic) UIButton *button;

- (void) startAnimation;

@end
