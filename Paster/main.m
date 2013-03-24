//
//  main.m
//  Paster
//
//  Created by tzzzoz on 13-3-6.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "PWGeoPaster.h"
#import "PWPaster.h"
#import "ImageConverter.h"
#import "PlistLoader.h"
#import "PWThemeFactory.h"
#import "PWPasterFactory.h"
#import "Configurer.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
//        NSString *path = [[[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Theme0"] stringByAppendingPathComponent:@"Images"] stringByAppendingPathComponent:@"ThemeBG.png"];
//        NSData* data = [ImageConverter imageToData:path];
//        NSLog(@"%i", [data length]);
//        NSLog(@"%@", path);
        
        
//        PWGeoPaster *geoPaster = [[PWGeoPaster alloc] initWithFrame:CGRectMake(40, 50, 200, 400)
//                                                          imageData:data
//                                                               type:Triangle
//                                                              color:black];
//        PWPaster *paster = [[PWPaster alloc] initWithFrame:CGRectMake(40, 50, 200, 400) imageData:data];
//        
//        [paster addGeoPaster:geoPaster];
//        NSLog(@"GeoPaster %i", [DataStorer saveObject:geoPaster fileName:@"geoPaster"]);
//        NSLog(@"Paster %i", [DataStorer saveObject:paster fileName:@"paster"]);
        
//        PWGeoPaster *newGeoPaster = []
        
        //Plist loader
//        PWThemeFactory *factory = [[PWThemeFactory alloc] init];
//        [factory createThemeThumbNail];
//        PWPasterFactory *pasterFactory = [[PWPasterFactory alloc] init];
//        [factory setDelegate:pasterFactory];
//        [factory createTheme:@"Theme0"];
        
//        NSLog(@"%i", [Configurer countOfThemes]);
    }
}
