//
//  PWGeoPasterEditViewController.m
//  Paster
//
//  Created by tzzzoz on 13-3-25.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "PWGeoPasterEditViewController.h"

@interface PWGeoPasterEditViewController ()

@end

@implementation PWGeoPasterEditViewController

@synthesize zoomOutButton;

@synthesize selectedGeoPaster, selectedColorGeoPaster;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    [self.zoomOutButton setImage:<#(UIImage *)#> forState:<#(UIControlState)#>]
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
