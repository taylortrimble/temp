//
//  FlagProcessor.m
//  temp
//
//  Created by Taylor Trimble on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlagProcessor.h"

@implementation FlagProcessor

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (flag)processFlag:(NSString *)flagArgument {
    if ([flagArgument caseInsensitiveCompare:@"-f"] == NSOrderedSame) {
        return farenheitFlag;
    } else if ([flagArgument caseInsensitiveCompare:@"-c"] == NSOrderedSame) {
        return celciusFlag;
    } else if ([flagArgument caseInsensitiveCompare:@"-k"] == NSOrderedSame) {
        return kelvinFlag;
    } else {
        return invalidFlag;
    }
}

@end
