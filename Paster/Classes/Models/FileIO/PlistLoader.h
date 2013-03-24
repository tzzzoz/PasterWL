//
//  PlistLoader.h
//  Paster
//
//  Created by tzzzoz on 13-3-14.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistLoader : NSObject


+(NSDictionary*)loadPlistByRelativePath:(NSString*) fileName;
@end
