//
//  PWTheme.h
//  Paster
//
//  Created by tzzzoz on 13-3-19.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Configurer.h"

@interface PWTheme : NSObject
{
    NSString *themeName;
    UIImage *backgroundImage;
    UIImage *thumbnailImage;
    UIImage *emptyImage;
    
    NSMutableArray *pasters;
    NSMutableArray *geoPasterContainer;
    NSMutableArray *geoPasterModels;
}

@property (nonatomic, strong) NSString *themeName;
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIImage *thumbnailImage;
@property (nonatomic, strong) UIImage *emptyImage;

@property (nonatomic, strong) NSMutableArray *pasters;
@property (nonatomic, strong) NSMutableArray *geoPasterContainer;
@property (nonatomic, strong) NSMutableArray *geoPasterModels;

-(id)initWithThemeName:(NSString *)name;
@end
