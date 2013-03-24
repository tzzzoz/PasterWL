//
//  AbstractPaster.m
//  Paster
//
//  Created by tzzzoz on 13-3-6.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "PWAbstractPaster.h"

@implementation PWAbstractPaster

@synthesize frame, imageData;

-(id)initWithFrame:(CGRect)rect
         imageData:(NSData *)binaryData
{
    self = [super init];
    if (self) {
        [self setFrame:rect];
        [self setImageData:binaryData];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setFrame:[aDecoder decodeCGRectForKey:@"frame"]];
        [self setImageData:[aDecoder decodeObjectForKey:@"imageData"]];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeCGRect:[self frame] forKey:@"frame"];
    [aCoder encodeObject:[self imageData] forKey:@"imageData"];
}

@end
