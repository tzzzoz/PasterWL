//
//  PWWonderlandViewController.h
//  Paster
//
//  Created by tzzzoz on 13-3-20.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "PWTheme.h"
#import "ImageConverter.h"

@interface PWWonderlandViewController : UIViewController
{
    //视图对象
    UIImageView *bgImageView;
    NSMutableArray *pasterButtonArray;
    
    //模型对象
    PWTheme *selectedTheme;
}

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) NSMutableArray *pasterButtonArray;

@property (nonatomic, strong) PWTheme *selectedTheme;

-(IBAction)returnBack:(id)sender;
@end
