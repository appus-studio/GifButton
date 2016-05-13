//
//  GifButton.m
//  testAnimation
//
//  Created by Vlad Kosyi on 5/10/16.
//  Copyright © 2016 Vlad Kosyi. All rights reserved.
//

#import "GifButton.h"
#import "UIImage+animatedGIF.h"

@interface GifButton ()

@end

@implementation GifButton

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self updateImagesArray:nil];
  }
  
  return self;
}


- (void)setRepeatCount:(NSInteger)repeatCount {
    _repeatCount = repeatCount;
    self.imageView.animationRepeatCount = _repeatCount;
}

- (void)setAnimationDuration:(double)animationDuration{
  
  _animationDuration = animationDuration;
  self.imageView.animationDuration = _animationDuration;
  
}

- (void)setGifName:(NSString *)gifName{
  _gifName = gifName;
  [self updateImagesArray:nil];
}

- (void)setImagesArray:(NSArray *)imagesArray{
  _imagesArray = imagesArray;
  [self updateImagesArray:imagesArray];
}

- (void) updateImagesArray:(NSArray *)imagesArray {
  
  if (self.imagesArray == nil) {
    if (self.gifName.length != 0) {
      NSURL *url = [[NSBundle mainBundle] URLForResource:self.gifName withExtension:@"gif"];
      NSDictionary *dict = [UIImage animatedImageDictionaryWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];
      self.imagesArray = dict[@"array"];
      if (self.animationDuration == 0) {
        self.imageView.animationDuration = [dict[@"duration"]doubleValue];
      }
    }
    
  } else {
    self.imageView.animationImages = self.imagesArray;
  }
}

- (void)startAnimation{
  
  if (self.imagesArray != nil) {
    if (!self.imageView.isAnimating) {
      
      [self setImage:[self.imageView.animationImages lastObject] forState:UIControlStateNormal];
      [self.imageView startAnimating];
      
      [self performSelector:@selector(starAnimationDidFinish) withObject:nil afterDelay:self.imageView.animationDuration * self.imageView.animationRepeatCount + 0.1f];

      self.userInteractionEnabled = NO;
    }
    
  } else {
    NSLog(@"Empry array");
  }
  
}


- (void)starAnimationDidFinish {
  
      self.imageView.animationImages = [[self.imageView.animationImages reverseObjectEnumerator] allObjects];
      self.userInteractionEnabled = YES;
}

@end
