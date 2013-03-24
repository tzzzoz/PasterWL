//
//  PWPaster.h
//  Paster
//
//  Created by tzzzoz on 13-3-8.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "PWAbstractPaster.h"
#import "PWGeoPaster.h"

@interface PWPaster : PWAbstractPaster<NSCoding> {
    NSMutableArray *geoPasters;
}

@property (nonatomic, strong) NSMutableArray *geoPasters;


-(id)initWithFrame:(CGRect)rect
         imageData:(NSData *)binaryData
        geoPasters:(NSMutableArray*) geometries;
-(id)initWithFrame:(CGRect)rect
         imageData:(NSData *)binaryData;

//Add geometry paster to paster
-(void) addGeoPaster:(PWGeoPaster *)geoPaster;
@end
