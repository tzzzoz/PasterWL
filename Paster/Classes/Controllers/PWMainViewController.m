//
//  MainViewController.m
//  Paster
//
//  Created by tzzzoz on 13-3-14.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "PWMainViewController.h"

@interface PWMainViewController ()

@end

@implementation PWMainViewController

@synthesize scrollView,themeButtonArray;
@synthesize themeFactory;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //初始化该控制器需要的数据源
        themeButtonArray = [[NSMutableArray alloc] init];
        themeFactory = [[PWThemeFactory alloc] init];
        PWPasterFactory *pasterFactory = [[PWPasterFactory alloc] init];
        [themeFactory setDelegate:pasterFactory];

        NSMutableArray *imageArray = [themeFactory createThemeThumbNail];
        for (UIImage *image in imageArray) {
            UIButton *themeButton = [[UIButton alloc] init];
            [themeButton setImage:image forState:UIControlStateNormal];
            [themeButtonArray addObject:themeButton];
        }
    
        for (NSString *themeName in [Configurer themeNames]) {
            [themeFactory createTheme:themeName];
        }
    }
    return self;
}


-(void)tapThemeButton:(UIButton*)button
{
    //告诉WonderlandViewController是哪一个主题被选中
    NSInteger selectedIndex = [themeButtonArray indexOfObject:button];
    PWWonderlandViewController *wonderlandViewController = [[PWWonderlandViewController alloc] initWithNibName:@"PWWonderlandView" bundle:nil];
    [wonderlandViewController setSelectedTheme:[[themeFactory themeArray] objectAtIndex:selectedIndex]];
    [[RootViewController sharedRootViewController] pushViewController:wonderlandViewController];
}


-(void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 230, 1024, 460)];
//    [scrollView setBackgroundColor:[UIColor blackColor]];
    
    //计算scrollView的宽度
    NSInteger gap = 135;
    NSInteger sideBar = 235;
    NSInteger widthOfThemeButton = 540;
    NSInteger countOfThemeButtons = [themeButtonArray count];
    NSInteger scrollerViewWidth = 2 * sideBar + countOfThemeButtons * widthOfThemeButton + (countOfThemeButtons - 1) * gap;
    scrollView.contentSize = CGSizeMake(scrollerViewWidth, 350);
    scrollView.contentOffset = CGPointMake(0, 0);
    [scrollView setBouncesZoom:NO];
    
    
    //添加themeButton到scrollView
    for (int i = 0; i < countOfThemeButtons; i++) {
        UIButton *themeButton = [themeButtonArray objectAtIndex:i];
        [themeButton setFrame:CGRectMake(235+i*(540+135), 55, 540, 350)];
        NSString *imagePath = [Configurer imagePath:[@"frameImage" stringByAppendingFormat:@"%i.png", i%5]];
        UIImage *bgImage = [UIImage imageWithContentsOfFile:imagePath];
        [themeButton setBackgroundImage:bgImage forState:UIControlStateNormal];
        [themeButton setImageEdgeInsets:UIEdgeInsetsMake(19, 19, 23, 26)];
        [themeButton addTarget:self action:@selector(tapThemeButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [scrollView addSubview:themeButton];
    }
    [[self view] addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
