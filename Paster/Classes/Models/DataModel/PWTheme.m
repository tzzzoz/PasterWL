//
//  PWTheme.m
//  Paster
//
//  Created by tzzzoz on 13-3-19.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "PWTheme.h"

@implementation PWTheme

@synthesize themeName, backgroundImage, thumbnailImage, emptyImage, pasters, geoPasterContainer, geoPasterModels;

-(id)initWithThemeName:(NSString *)name
{
    self = [super init];
    if (self) {
        [self setThemeName:name];
        [self setThumbnailImage:[self createThumbnailImage]];
        [self setEmptyImage:[self createEmptyImage]];
        [self setBackgroundImage:[self createBackgroundImage]];
        [self setPasters:[[NSMutableArray alloc] init]];
        [self setGeoPasterContainer:[[NSMutableArray alloc] init]];
        [self setGeoPasterModels:[[NSMutableArray alloc] init]];
    }
    return  self;
}

-(UIImage*)createThumbnailImage
{
    NSString *imagePath = [[Configurer imageFolderPath:themeName] stringByAppendingPathComponent:@"ThemeThumbnail.png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}

-(UIImage*)createBackgroundImage
{
    NSString *imagePath = [[Configurer imageFolderPath:themeName] stringByAppendingPathComponent:@"ThemeBG.png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}

-(UIImage*)createEmptyImage
{
    NSString *imagePath = [[Configurer imageFolderPath:themeName] stringByAppendingPathComponent:@"ThemeEmpty.png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}
@end
