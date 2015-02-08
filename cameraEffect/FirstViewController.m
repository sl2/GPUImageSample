//
//  FirstViewController.m
//  cameraEffect
//
//  Created by s on 2/7/15.
//  Copyright (c) 2015 so. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self drawBorder];
}

- (void)drawBorder {
    UIGraphicsBeginImageContext(self.coverImage.image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.coverImage.image drawAtPoint:CGPointZero];
    CGRect rect = CGRectMake(0, 0, self.coverImage.image.size.width, self.coverImage.image.size.height);
    
    CGFloat borderSize = 10.f;
    
    //top
    rect = CGRectMake(0, 0, self.coverImage.image.size.width, borderSize);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextFillRect(context, rect);
    
    //bottom
    rect = CGRectMake(0, self.coverImage.image.size.height - borderSize * 5, self.coverImage.image.size.width, borderSize * 5);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextFillRect(context, rect);
    
    //left
    rect = CGRectMake(0, 0, borderSize, self.coverImage.image.size.height);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextFillRect(context, rect);
    
    //left
    rect = CGRectMake(self.coverImage.image.size.width - borderSize, 0, borderSize, self.coverImage.image.size.height);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextFillRect(context, rect);
    
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.coverImage.image = retImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)applyEffect1:(id)sender {
    self.coverImage.image = [self sepiaFilter:self.coverImage.image];
    [self drawBorder];
}

- (IBAction)applyEffect2:(id)sender {
    self.coverImage.image =[self sketchFilter:self.coverImage.image];
    [self drawBorder];
}

- (UIImage*) sepiaFilter:(UIImage*)image {
    UIImage *inputImage = image;
    GPUImagePicture *imagePicture = [[GPUImagePicture alloc] initWithImage:inputImage];
    GPUImageSepiaFilter *filter = [[GPUImageSepiaFilter alloc] init];
    [imagePicture addTarget:filter];
    [imagePicture processImage];
    UIImage *outputImage = [filter imageByFilteringImage:inputImage];
    return outputImage;
}

- (UIImage*) sketchFilter:(UIImage*)image {
    UIImage *inputImage = self.coverImage.image;
    GPUImagePicture *imagePicture = [[GPUImagePicture alloc] initWithImage:inputImage];
    GPUImageSketchFilter *filter = [[GPUImageSketchFilter alloc] init];
    [imagePicture addTarget:filter];
    [imagePicture processImage];
    UIImage *outputImage = [filter imageByFilteringImage:inputImage];
    return outputImage;
}

- (UIImage*) saturationFilter:(UIImage*)image {
    UIImage *inputImage = self.coverImage.image;
    GPUImagePicture *imagePicture = [[GPUImagePicture alloc] initWithImage:inputImage];
    GPUImageSaturationFilter *filter = [[GPUImageSaturationFilter alloc] init];
    [imagePicture addTarget:filter];
    [imagePicture processImage];
    UIImage *outputImage = [filter imageByFilteringImage:inputImage];
    return outputImage;
}

- (UIImage*) vignettingFilter:(UIImage*)image {
    UIImage *inputImage = self.coverImage.image;
    GPUImagePicture *imagePicture = [[GPUImagePicture alloc] initWithImage:inputImage];
    GPUImageVignetteFilter *filter = [[GPUImageVignetteFilter alloc] init];
    [imagePicture addTarget:filter];
    [imagePicture processImage];
    UIImage *outputImage = [filter imageByFilteringImage:inputImage];
    return outputImage;
}

- (UIImage*) amatorkaFilter:(UIImage*)image {
    UIImage *inputImage = image;
    GPUImagePicture *imagePicture = [[GPUImagePicture alloc] initWithImage:inputImage];
    GPUImageAmatorkaFilter *filter = [[GPUImageAmatorkaFilter alloc] init];
    [imagePicture addTarget:filter];
    [imagePicture processImage];
    UIImage *outputImage = [filter imageByFilteringImage:inputImage];
    return outputImage;
}








@end
