//
//  PWGeoPaster.h
//  Paster
//
//  Created by tzzzoz on 13-3-8.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "PWAbstractPaster.h"
#import "EnumClass.h"

@interface PWGeoPaster : PWAbstractPaster<NSCoding> {
    GeometryType type;
    ColorType   color;
    BOOL    isCreated;                  //default is NO
}

@property (nonatomic) GeometryType type;
@property (nonatomic) ColorType color;
@property (nonatomic) BOOL isCreated;

-(id)initWithFrame:(CGRect)rect
         imageData:(NSData *)binaryData
      type:(GeometryType)geometryType
         color:(ColorType) colorType;
@end
