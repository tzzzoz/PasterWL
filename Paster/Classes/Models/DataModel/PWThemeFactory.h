//
//  ThemeFactory.h
//  Paster
//
//  Created by tzzzoz on 13-3-19.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWPaster.h"
#import "PWTheme.h"
#import "Configurer.h"

@protocol PWThemeFactoryDelegate


-(PWPaster*)createPasterWithRect:(CGRect)rect
                       imageFile:(NSString*)fileName
                 imageFolderPath:(NSString*)path;
-(PWGeoPaster*)createGeoPasterWithRect:(CGRect)rect
                                  type:(GeometryType)type
                                  color:(ColorType)color
                              imageFile:(NSString *)fileName
                        imageFolderPath:(NSString *)path;
-(PWGeoPaster*)createGeoPasterModelWithRect:(CGRect)rect
                                       type:(GeometryType)type
                                      color:(ColorType)color
                                  imageFile:(NSString *)fileName
                            imageFolderPath:(NSString *)path;
-(PWGeoPaster *)createGeoPasterEmptyWithRect:(CGRect)rect
                                        type:(GeometryType)type
                                       color:(ColorType)color
                                   imageFile:(NSString *)fileName
                             imageFolderPath:(NSString *)path;
@end


@interface PWThemeFactory : NSObject
{
    id <PWThemeFactoryDelegate> delegate;
    NSMutableArray *themeArray;
}

@property (nonatomic, strong) id <PWThemeFactoryDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *themeArray;

-(NSMutableArray*)createThemeThumbNail;
-(void)createTheme:(NSString*)themeName;
@end
