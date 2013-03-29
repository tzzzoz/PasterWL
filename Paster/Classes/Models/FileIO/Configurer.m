//
//  ImageLoader.m
//  Paster
//
//  Created by tzzzoz on 13-3-11.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "Configurer.h"

@implementation Configurer

+(NSInteger)countOfThemes
{
    NSDictionary *dict = [PlistLoader loadPlistByRelativePath:@"Config"];
    NSArray *themeArray = [dict objectForKey:@"Themes"];
    return [themeArray count];
}

+(NSInteger)countOfColors{
    NSDictionary *dict = [PlistLoader loadPlistByRelativePath:@"Config"];
    NSDictionary *colorDict = [dict objectForKey:@"Colors"];
    return [colorDict count];
}

+(NSMutableArray*)themeNames
{
    NSDictionary *dict = [PlistLoader loadPlistByRelativePath:@"Config"];
    NSArray *themeArray = [dict objectForKey:@"Themes"];
    NSMutableArray *themeNames = [[NSMutableArray alloc] init];
    for (NSDictionary *themeDict in themeArray) {
        [themeNames addObject:[themeDict objectForKey:@"ThemeName"]];
    }
    return themeNames;
}

+(NSString*)plistPath:(NSString *)themeName
{
    NSString* path = [[themeName stringByAppendingPathComponent:@"Plists"] stringByAppendingPathComponent:themeName];
    return path;
}

+(NSString *)imageFolderPath:(NSString *)themeName
{
    NSString *path = [[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:themeName] stringByAppendingPathComponent:@"Images"];
    return path;
}

+(NSString *)imagePath:(NSString *)fileName
{
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
    return path;
}
@end
