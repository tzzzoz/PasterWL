//
//  ScreenShoter.m
//  Paster
//
//  Created by tzzzoz on 13-3-27.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "ScreenShoter.h"
#import <QuartzCore/QuartzCore.h>

@implementation ScreenShoter

+(UIImage *)imageFromView:(UIView *)view Frame:(CGRect)frame
{
    UIGraphicsBeginImageContext(frame.size);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    NSLog(@"%@", image);
    return image;
}

@end
