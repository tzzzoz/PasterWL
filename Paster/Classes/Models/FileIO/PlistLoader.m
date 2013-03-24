//
//  PlistLoader.m
//  Paster
//
//  Created by tzzzoz on 13-3-14.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "PlistLoader.h"

@implementation PlistLoader

+(NSDictionary *)loadPlistByRelativePath:(NSString *)relativePath
{
    //get the plist file from bundle
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:relativePath ofType:@"plist"];
    //build the array from the plist
    NSDictionary *dataOfPlist = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    return dataOfPlist;
}
@end
