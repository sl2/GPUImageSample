//
//  FirstViewController.h
//  cameraEffect
//
//  Created by s on 2/7/15.
//  Copyright (c) 2015 so. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *coverImage;

- (IBAction)applyEffect1:(id)sender;
- (IBAction)applyEffect2:(id)sender;

@end

