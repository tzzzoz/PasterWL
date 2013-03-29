//
//  ScreenShoter.h
//  Paster
//
//  Created by tzzzoz on 13-3-27.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScreenShoter : NSObject

+(UIImage*)imageFromView:(UIView*) view Frame:(CGRect) frame;
@end
