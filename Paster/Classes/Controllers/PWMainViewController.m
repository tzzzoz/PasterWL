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

@synthesize themeScrollView, pageControl, themeButtonArray;
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
    themeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 230, 1024, 450)];
    
    //计算themeScrollView的宽度
    NSInteger gap = 135;
    NSInteger sideBar = 232;
    NSInteger widthOfThemeButton = 560;
    NSInteger countOfThemeButtons = [themeButtonArray count];
    NSInteger contentWidth = 2 * sideBar + countOfThemeButtons * widthOfThemeButton + (countOfThemeButtons - 1) * gap;
    themeScrollView.contentSize = CGSizeMake(contentWidth, 450);
    themeScrollView.pagingEnabled = YES;
    themeScrollView.delegate = self;
    themeScrollView.showsHorizontalScrollIndicator = NO;
    themeScrollView.showsVerticalScrollIndicator = NO;

    //添加themeButton到scrollView
    for (int i = 0; i < countOfThemeButtons; i++) {
        UIButton *themeButton = [themeButtonArray objectAtIndex:i];
        themeButton.frame = CGRectMake(sideBar + i * (widthOfThemeButton + gap), 20, widthOfThemeButton, 420);
        NSString *imagePath = [Configurer imagePath:[@"frameImage" stringByAppendingFormat:@"%i.png", i%5]];
        UIImage *bgImage = [UIImage imageWithContentsOfFile:imagePath];
        [themeButton setBackgroundImage:bgImage forState:UIControlStateNormal];
        [themeButton setImageEdgeInsets:UIEdgeInsetsMake(19, 19, 23, 26)];
        [themeButton addTarget:self action:@selector(tapThemeButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [themeScrollView addSubview:themeButton];
    }
    [self.view addSubview:themeScrollView];
    
    
    //添加pageControl控件
    int pagesCount = countOfThemeButtons;
    pageControl = [[UIPageControl alloc] init];
    [pageControl setBounds:CGRectMake(0,0,1024,30)];
    pageControl.center = CGPointMake(512, 700);
//    [pageControl sizeToFit];
    pageControl.numberOfPages = pagesCount;
    pageControl.currentPage = 0;
    [pageControl.layer setCornerRadius:8];
//    pageControl.backgroundColor = [UIColor blackColor];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];

    NSLog(@"Y: %f", pageControl.frame.origin.y);
    [self.view addSubview:pageControl];
    NSLog(@"X: %f", pageControl.frame.origin.x);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    UIView *subView0 = [scrollView.subviews objectAtIndex:0];
    UIView *subView1 = [scrollView.subviews objectAtIndex:1];
    NSInteger offsetUnitX = subView1.frame.origin.x - subView0.frame.origin.x;
    
    pageControl.currentPage = offset.x / offsetUnitX;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
