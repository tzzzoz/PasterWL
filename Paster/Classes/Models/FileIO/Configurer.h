//
//  ImageLoader.h
//  Paster
//
//  Created by tzzzoz on 13-3-11.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlistLoader.h"

@interface Configurer : NSObject

+(NSInteger)countOfThemes;
+(NSInteger)countOfColors;
+(NSMutableArray*)themeNames;
+(NSString*)plistPath:(NSString *)themeName;
+(NSString*)imageFolderPath:(NSString *)themeName;
+(NSString*)imagePath:(NSString *)fileName;
@end
