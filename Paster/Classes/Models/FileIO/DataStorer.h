//
//  DataStorer.h
//  Paster
//
//  Created by tzzzoz on 13-3-12.
//  Copyright (c) 2013年 Wuxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWGeoPaster.h"

@interface DataStorer : NSObject

+(BOOL)saveObject:(id)object fileName:(NSString*) fileName;


+(NSString*)documentDirectory;
@end
