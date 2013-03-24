//
//  AbstractPaster.h
//  Paster
//
//  Created by tzzzoz on 13-3-6.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PWAbstractPaster : NSObject<NSCoding> {
    CGRect frame;
    NSData *imageData;
}

@property (nonatomic, assign) CGRect frame;
@property (nonatomic, strong) NSData *imageData;


-(id)initWithFrame:(CGRect)rect
         imageData:(NSData *)binaryData;
@end
