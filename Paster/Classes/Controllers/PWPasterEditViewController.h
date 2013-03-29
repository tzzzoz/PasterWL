//
//  PWPasterEditViewController.h
//  Paster
//
//  Created by tzzzoz on 13-3-22.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "RootViewController.h"
#import "PWPaster.h"
#import "ScreenShoter.h"

@interface PWPasterEditViewController : UIViewController
{
    //视图对象
    UIScrollView *geoModelScrollView;
    UIScrollView *colorGeoScrollView;
    UIImageView *pasterView;
    NSMutableArray *geoModelButtonArray;
    NSMutableArray *colorGeoButtonArray;
    
    //模型对象
    PWPaster *selectedPaster;
    PWTheme *themeOnwer;
    NSMutableArray *specificShapeArray;
}

@property (nonatomic, strong) UIScrollView *geoModelScrollView;
@property (nonatomic, strong) UIScrollView *colorGeoScrollView;
@property (nonatomic, strong) UIImageView *pasterView;
@property (nonatomic, strong) NSMutableArray *geoModelButtonArray;
@property (nonatomic, strong) NSMutableArray *colorGeoButtonArray;


@property (nonatomic, strong) PWPaster *selectedPaster;
@property (nonatomic, strong) PWTheme *themeOnwer;
@property (nonatomic, strong) NSMutableArray *specificShapeArray;

-(IBAction)returnBack:(id)sender;
-(void)tapGeoModelButton:(UIButton *)button;
@end
