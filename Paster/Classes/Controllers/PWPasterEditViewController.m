//
//  PWPasterEditViewController.m
//  Paster
//
//  Created by tzzzoz on 13-3-22.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "PWPasterEditViewController.h"

@interface PWPasterEditViewController ()

@end

@implementation PWPasterEditViewController

@synthesize geoModelScrollView, colorGeoScrollView, pasterView, geoModelButtonArray, colorGeoButtonArray;

@synthesize selectedPaster, themeOnwer, specificShapeArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.pasterView = [[UIImageView alloc] initWithFrame:CGRectMake(105, 35, 865, 630)];
        self.geoModelScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(105, 667, 890, 91)];
        self.colorGeoScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(105, 667, 890, 91)];
        self.geoModelButtonArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(IBAction)returnBack:(id)sender
{
    [[RootViewController sharedRootViewController] popViewController];
}

-(void)returnBackToModelScrollView:(id)sender
{
    [self.colorGeoScrollView removeFromSuperview];
    for (UIView *view in [self.colorGeoScrollView subviews]) {
        [view removeFromSuperview];
    }
    [self.view addSubview:geoModelScrollView];
}


-(void)tapGeoModelButton:(UIButton *)button
{
    NSInteger selectedIndex = [geoModelButtonArray indexOfObject:button];
    specificShapeArray = [[themeOnwer geoPasterContainer] objectAtIndex:selectedIndex];
    
    NSInteger count = [specificShapeArray count];
    for (int i = 1; i < count; i++) {
        PWGeoPaster *geoPaster = [specificShapeArray objectAtIndex:i];
        UIButton *colorGeoButton = [[UIButton alloc] initWithFrame:geoPaster.frame];
        UIImage *image = [ImageConverter dataToImage:[geoPaster imageData]];
        [colorGeoButton setImage:image forState:UIControlStateNormal];
        [colorGeoButton addTarget:self action:@selector(tapColorGeoButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.colorGeoButtonArray addObject:colorGeoButton];
        [self.colorGeoScrollView addSubview:colorGeoButton];
    }
    //添加返回几何贴纸model的按钮
    UIButton *returnButton = [[UIButton alloc] initWithFrame:CGRectMake(3, 3, 85, 85)];
    [returnButton setImage:[UIImage imageNamed:@"returnBack.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnBackToModelScrollView:) forControlEvents:UIControlEventTouchUpInside];
    [self.colorGeoScrollView addSubview:returnButton];
    [self.geoModelScrollView removeFromSuperview];
    [self.view addSubview:colorGeoScrollView];
    
}


-(void)tapColorGeoButton:(UIButton *)button
{
    [button setHighlighted:NO];
    NSInteger selectedIndex = [colorGeoButtonArray indexOfObject:button] + 1;
    PWGeoPaster *selectedColorGeoPaster = [specificShapeArray objectAtIndex:selectedIndex];
    PWGeoPasterEditViewController *geoPasterEditViewController = [[PWGeoPasterEditViewController alloc] initWithNibName:@"PWGeoPasterEditView" bundle:nil];
    [geoPasterEditViewController setSelectedColorGeoPaster:selectedColorGeoPaster];
    [[RootViewController sharedRootViewController] pushViewController:geoPasterEditViewController];
    [[geoPasterEditViewController zoomOutButton] setImage:[ScreenShoter imageFromView:[self view] Frame:CGRectMake(0, 0, 1024, 768)] forState:UIControlStateNormal];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //显示选中贴纸的view
    [self.pasterView setImage:[ImageConverter dataToImage:[selectedPaster imageData]]];
    [self.view addSubview:pasterView];
    
    //根据模型层[themeOwner geoPasters]中几何贴纸的数据，初始化并显示几何贴纸model的view
    for (PWGeoPaster *geoPasterModel in [themeOnwer geoPasterModels]) {
        UIButton *geoModelButton = [[UIButton alloc] initWithFrame:[geoPasterModel frame]];
        UIImage *image = [ImageConverter dataToImage:geoPasterModel.imageData];
        [geoModelButton setImage:image forState:UIControlStateNormal];
        [geoModelButton addTarget:self action:@selector(tapGeoModelButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.geoModelButtonArray addObject:geoModelButton];
        [self.geoModelScrollView addSubview:geoModelButton];
    }
    
    
    [self.view addSubview:geoModelScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
