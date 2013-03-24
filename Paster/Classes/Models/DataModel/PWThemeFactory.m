//
//  ThemeFactory.m
//  Paster
//
//  Created by tzzzoz on 13-3-19.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "PWThemeFactory.h"

@implementation PWThemeFactory


@synthesize  delegate, themeArray;


-(id)init
{
    self = [super init];
    if (self) {
        themeArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSMutableArray *)createThemeThumbNail
{
    NSInteger countOfThemes = [Configurer countOfThemes];
    NSMutableArray *thumbnailArray = [[NSMutableArray alloc] initWithCapacity:countOfThemes];
    for (int i = 0; i < countOfThemes; i++) {
        
        NSString *imagePath = [[Configurer imageFolderPath:[@"Theme" stringByAppendingFormat:@"%i", i]] stringByAppendingPathComponent:@"ThemeThumbnail.png"];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        [thumbnailArray addObject:image];
    };
    
    return thumbnailArray;
}

-(void)createTheme:(NSString *)themeName
{
    PWTheme *theme = [[PWTheme alloc] initWithThemeName:themeName];
    //读取Theme内的Plist文件
    NSString *relativePath = [Configurer plistPath:themeName];
    NSDictionary *themeDict = [PlistLoader loadPlistByRelativePath:relativePath];
    
    NSArray *pasterArray = [themeDict objectForKey:@"Pasters"];
    NSArray *geoPasterModelArray = [themeDict objectForKey:@"GeoPasterModels"];
    NSArray *geoPasterArray = [themeDict objectForKey:@"GeoPasters"];
    NSDictionary *specificPositionDict = [themeDict objectForKey:@"SpecificPosition"];
    
    //创建贴纸,利用Plist中的信息
    for (NSDictionary *pasterDict in pasterArray) {
        NSInteger x = [[pasterDict objectForKey:@"X"] intValue];
        NSInteger y = [[pasterDict objectForKey:@"Y"] intValue];
        NSInteger width = [[pasterDict objectForKey:@"Width"] intValue];
        NSInteger height = [[pasterDict objectForKey:@"Height"] intValue];
        
        NSString* fileName = [pasterDict objectForKey:@"FileName"];
        
        PWPaster *paster = [delegate createPasterWithRect:CGRectMake(x, y, width, height)
                             imageFile:fileName
                       imageFolderPath:[Configurer imageFolderPath:themeName]];
        [[theme pasters] addObject:paster];
    }
    
    
    //创建几何贴纸Model,利用Plist中的信息
    NSDictionary *geoModelPositionDict = [specificPositionDict objectForKey:@"GeoModel"];
    NSInteger startX = [[geoModelPositionDict objectForKey:@"StartX"] intValue];
    NSInteger startY = [[geoModelPositionDict objectForKey:@"StartY"] intValue];
    NSInteger gapLength = [[geoModelPositionDict objectForKey:@"GapLength"] intValue];
    NSInteger width = [[geoModelPositionDict objectForKey:@"Width"] intValue];
    NSInteger height = [[geoModelPositionDict objectForKey:@"Height"] intValue];
    
    int index = 0;
    CGRect frame;
    for (NSDictionary *geoPasterModelDict in geoPasterModelArray) {
        GeometryType type = [[geoPasterModelDict objectForKey:@"Type"] intValue];
        ColorType color = [[geoPasterModelDict objectForKey:@"Color"] intValue];
        NSString *fileName = [geoPasterModelDict objectForKey:@"FileName"];
        
        NSInteger x = startX + (width + gapLength) * index;
        NSInteger y = startY;
        frame = CGRectMake(x, y, width, height);
        
        PWGeoPaster *geoPasterModel = [delegate createGeoPasterModelWithRect:frame
                                                                        type:type
                                                                       color:color
                                                                   imageFile:fileName
                                                             imageFolderPath:[Configurer imageFolderPath:themeName]];
        [[theme geoPasterModels] addObject:geoPasterModel];
        
        NSMutableArray *specificShapeArray = [[NSMutableArray alloc] init];
        [specificShapeArray addObject:geoPasterModel];
        [[theme geoPasterContainer] addObject:specificShapeArray];
        
        index++;
    }
    
    //TODO 创建默认的几何贴纸
    NSDictionary *geoPasterPositionDict = [specificPositionDict objectForKey:@"GeoPaster"];
    startX = [[geoPasterPositionDict objectForKey:@"StartX"] intValue];
    startY = [[geoPasterPositionDict objectForKey:@"StartY"] intValue];
    gapLength = [[geoPasterPositionDict objectForKey:@"GapLength"] intValue];
    width = [[geoPasterPositionDict objectForKey:@"Width"] intValue];
    height = [[geoPasterPositionDict objectForKey:@"Height"] intValue];
    
    NSInteger outsideCount = [[theme geoPasterContainer] count];
    
    for (int i = 0; i < outsideCount; i++) {
        NSMutableArray *specificShapeArray = [[theme geoPasterContainer] objectAtIndex:i];
        
        NSDictionary *geoPasterDefaultDict = [geoPasterArray objectAtIndex:i];
        GeometryType type = [[geoPasterDefaultDict objectForKey:@"Type"] intValue];
        ColorType color = [[geoPasterDefaultDict objectForKey:@"Color"] intValue];
        NSString *fileName = [geoPasterDefaultDict objectForKey:@"FileName"];
        
        PWGeoPaster *geoPasterDefault = [delegate createGeoPasterWithRect:CGRectMake(startX, startY, width, height)
                                                                     type:type
                                                                    color:color
                                                                imageFile:fileName
                                                          imageFolderPath:[Configurer imageFolderPath:themeName]];
        [specificShapeArray addObject:geoPasterDefault];
        
        NSInteger insideCount = [Configurer countOfColors];
        CGRect frame;
        for (int j = 2; j < insideCount + 1; j++) {
            ColorType color = j;
            NSInteger x = startX + (width + gapLength) * (j - 1);
            NSInteger y = startY;
            frame = CGRectMake(x, y, width, height);
            NSString *newFileName = [@"Empty" stringByAppendingString:[fileName substringFromIndex:7]];
            
            PWGeoPaster *geoPaster = [delegate createGeoPasterEmptyWithRect:frame type:type color:color imageFile:newFileName imageFolderPath:[Configurer imageFolderPath:themeName]];
            [specificShapeArray addObject:geoPaster];
        }
        
    }
    
    [themeArray addObject:theme];
}

@end
