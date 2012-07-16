//
//  Temperature.m
//  temp
//
//  Created by Taylor Trimble on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Temperature.h"

@implementation Temperature

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)setKelvinTemperature:(double)kelvinTemp
{
    kelvinTemperature = kelvinTemp;
}

- (void)setCelsiusTemperature:(double)celsiusTemp
{
    kelvinTemperature = celsiusTemp + 273.15;
}

- (void)setFahrenheitTemperature:(double)fahrenheitTemperature
{
    kelvinTemperature = (fahrenheitTemperature + 459.67)*5.0/9.0;
}

- (double)kelvinTemperature
{
    return kelvinTemperature;
}

- (double)celsiusTemperature
{
    return kelvinTemperature - 273.15;
}

- (double)fahrenheitTemperature
{
    return kelvinTemperature*9.0/5.0 - 459.67;
}

@end
