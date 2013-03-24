//
//  PWPaster.m
//  Paster
//
//  Created by tzzzoz on 13-3-8.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "PWPaster.h"

@implementation PWPaster

@synthesize geoPasters;

-(id)init
{
    return [self initWithFrame:CGRectMake(0, 0, 0, 0)
              imageData:[[NSData alloc] init]
             geoPasters:[[NSMutableArray alloc] init]];
}

-(id)initWithFrame:(CGRect)rect
         imageData:(NSData *)binaryData
{
    return [self initWithFrame:rect
                     imageData:binaryData
                    geoPasters:[[NSMutableArray alloc] init]];
}

-(id)initWithFrame:(CGRect)rect
         imageData:(NSData *)binaryData
        geoPasters:(NSMutableArray *)geometries
{
    self = [super initWithFrame:rect
                      imageData:binaryData];
    
    if (self) {
        [self setGeoPasters:geometries];
    }
    return self;
}

-(void)addGeoPaster:(PWGeoPaster *)geoPaster
{
    if (geoPaster) {
        [[self geoPasters] addObject:geoPaster];
    }
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setGeoPasters:[aDecoder decodeObjectForKey:@"geoPasters"]];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:[self geoPasters] forKey:@"geoPasters"];
}

@end
