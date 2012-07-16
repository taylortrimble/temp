//
//  Temperature.h
//  temp
//
//  Created by Taylor Trimble on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Temperature : NSObject {
    double kelvinTemperature;
}

@property double kelvinTemperature;
@property double celsiusTemperature;
@property double fahrenheitTemperature;

@end
