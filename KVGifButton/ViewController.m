//
//  ViewController.m
//  KVGifButton
//
//  Created by Vlad Kosyi on 5/10/16.
//  Copyright © 2016 Vlad Kosyi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *gifButton;
@property (strong, nonatomic) NSMutableArray *imageArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 39; i++) {
        [self.imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]]];
    }
    
    [self.gifButton setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateNormal];
    
    self.gifButton.imageView.animationImages = self.imageArray;
    self.gifButton.imageView.animationRepeatCount = 1;
    self.gifButton.imageView.animationDuration = 2;
    
    self.gifButton.imageView.image = self.imageArray[0];
    [self.gifButton setBackgroundImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateNormal];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)gifImageAction:(id)sender {
    
    if (!self.gifButton.imageView.isAnimating) {
        
        [self.gifButton.imageView startAnimating];
        [self.gifButton setBackgroundImage:[self.gifButton.imageView.animationImages lastObject] forState:UIControlStateNormal];
        [self performSelector:@selector(starAnimationDidFinish) withObject:nil afterDelay:self.gifButton.imageView.animationDuration];
        self.gifButton.userInteractionEnabled = NO;
    }
}

- (void)starAnimationDidFinish {
    NSArray *reversedImages = [[self.gifButton.imageView.animationImages reverseObjectEnumerator] allObjects];
    self.gifButton.imageView.animationImages = reversedImages;
    self.gifButton.userInteractionEnabled = YES;
}

@end
