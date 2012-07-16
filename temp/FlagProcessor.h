//
//  FlagProcessor.h
//  temp
//
//  Created by Taylor Trimble on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _flag {
    invalidFlag = 0,
    farenheitFlag = 1<<0,
    celciusFlag = 1<<1,
    kelvinFlag = 1<<2,
} flag;

@interface FlagProcessor : NSObject

- (flag)processFlag:(NSString *)flagArgument;

@end
