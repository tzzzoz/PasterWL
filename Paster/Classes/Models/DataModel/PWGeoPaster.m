//
//  PWGeoPaster.m
//  Paster
//
//  Created by tzzzoz on 13-3-8.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "PWGeoPaster.h"

@implementation PWGeoPaster

@synthesize type,color, isCreated;

-(id)init
{
    return [self initWithFrame:CGRectMake(0, 0, 0, 0)
                     imageData:[[NSData alloc] init]
                          type:0
                         color:0];
}

-(id)initWithFrame:(CGRect)rect imageData:(NSData *)binaryData
{
    return [self initWithFrame:rect imageData:binaryData type:0 color:0];
}

-(id)initWithFrame:(CGRect)rect
         imageData:(NSData *)binaryData
              type:(GeometryType)geometryType
             color:(ColorType)colorType
{
    self = [super initWithFrame:rect imageData:binaryData];
    if (self) {
        [self setType:geometryType];
        [self setColor:colorType];
        isCreated = NO;
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setType:[aDecoder decodeIntForKey:@"geometryType"]];
        [self setColor:[aDecoder decodeIntForKey:@"colorType"]];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeInt:[self type] forKey:@"geometryType"];
    [aCoder encodeInt:[self color] forKey:@"colorType"];
}

@end
