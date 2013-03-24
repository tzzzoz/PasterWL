//
//  ImageConverter.h
//  Paster
//
//  Created by tzzzoz on 13-3-11.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageConverter : NSObject


//Find the image file and convert it to NSData object
+(NSData*) imageToData:(NSString*) path;
//Retrieve UIImage according to NSData
+(UIImage*) dataToImage:(NSData*) data;
@end