//
//  ViewController.m
//  testAnimation
//
//  Created by Vlad Kosyi on 5/6/16.
//  Copyright © 2016 Vlad Kosyi. All rights reserved.
//

#import "ViewController.h"
#import "GifButton.h"
#import "UIImage+animatedGIF.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet GifButton *gifButton;
@property (strong, nonatomic) NSArray *imageArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSMutableArray *tempImageArray = [[NSMutableArray alloc]init];
//    
//    for (int i = 0; i < 39; i++) {
//        [tempImageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]]];
//    }
//  
//  self.imageArray = [NSArray arrayWithArray:tempImageArray];
  

//  NSURL *url = [[NSBundle mainBundle] URLForResource:@"gif" withExtension:@"gif"];
//  self.gifButton.imageView.image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];

//  self.imageView.image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];
//  self.imageArray = [UIImage animatedImageArrayWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];
//  self.gifButton.imagesArray = self.imageArray;
//  self.gifButton.animationDuration = 2;
//  self.gifButton.repeatCount = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (IBAction)gifImageAction:(id)sender {

    [self.gifButton startAnimation];
  

}


@end
