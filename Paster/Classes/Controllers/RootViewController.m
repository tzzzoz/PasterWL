//
//  RootViewController.m
//  Paster
//
//  Created by tzzzoz on 13-3-19.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

static  RootViewController *_sharedRootViewController = nil;
@synthesize viewControllersStack, currentViewController, nextViewController;

+ (RootViewController *) sharedRootViewController
{
    if (!_sharedRootViewController) {
        _sharedRootViewController = [[self alloc] init];
    }
    return _sharedRootViewController;
}

+(id)alloc
{
    NSAssert(_sharedRootViewController == nil, @"Attempted to allocate a second instance of a singleton.");
    return [super alloc];
}

-(id)init {
    self = [super init];
    if (self) {
        viewControllersStack = [[NSMutableArray alloc] init];
        currentViewController = nil;
        nextViewController = [[PWMainViewController alloc] initWithNibName:@"PWMainView" bundle:nil];
        [viewControllersStack addObject:nextViewController];
        [self display];
    }
    return self;
}


-(void)pushViewController:(UIViewController*) viewController {
    NSAssert(viewController != nil, @"Argument must be not nil");
    
    [viewControllersStack addObject:viewController];
    nextViewController = viewController;
    [self display];
}

-(void)popViewController {
    NSInteger count = [viewControllersStack count];
    
    if (count == 1) {
        [NSException raise:@"Remove Failed" format:@"Reason: Can't remove the last viewController"];
    } else {
        [viewControllersStack removeLastObject];
        nextViewController = [viewControllersStack lastObject];
        [self display];
    }
}

-(void)display {
    NSAssert(nextViewController != nil, @"nextViewController can't be nil");
//    nextViewController.view.layer.opacity = 1.0f;
    [nextViewController viewWillAppear:YES];
    [self.view addSubview:nextViewController.view];
    currentViewController = nextViewController;
    nextViewController = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
