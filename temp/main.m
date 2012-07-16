//
//  main.m
//  temp
//
//  Created by Taylor Trimble on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlagProcessor.h"
#import "Temperature.h"

int main (int argc, const char * argv[])
{
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSProcessInfo *processInfo = [NSProcessInfo processInfo];
    NSArray *arguments = [processInfo arguments];
    
    // Check for valid argument count
    if ([arguments count] < 3) {
        NSLog(@"usage: %@ [flag] temperature1, temperature2, ...", [processInfo processName]);
        return -1;
    }
    
    // Process flag
    FlagProcessor *flagProcessor = [[FlagProcessor alloc] init];
    flag temperatureFlag = [flagProcessor processFlag:[arguments objectAtIndex:1]];
    if (temperatureFlag == invalidFlag) {
        NSLog(@"usage: %@ [flag] temperature1, temperature2, ...", [processInfo processName]);
        [flagProcessor release];
        [pool drain];
        return -2;
    }
    
    NSMutableArray *processedTemperatures = [[NSMutableArray alloc] init];
    
    // Get temperature arguments
    NSArray *temperatureArguments = [arguments subarrayWithRange:NSMakeRange(2, [arguments count]-2)];
    for (NSString *argument in temperatureArguments) {
        
        double inputTemperature = 0;
        Temperature *processedTemperature = [[Temperature alloc] init];
        
        NSScanner *temperatureArgumentScanner = [NSScanner scannerWithString:argument];
        [temperatureArgumentScanner scanDouble:&inputTemperature];
        
        switch (temperatureFlag) {
            case farenheitFlag:
                [processedTemperature setFahrenheitTemperature:inputTemperature];
                break;
            case celciusFlag:
                [processedTemperature setCelsiusTemperature:inputTemperature];
                break;
            case kelvinFlag:
                [processedTemperature setKelvinTemperature:inputTemperature];
                break;
            default:
                break;
        }
        
        [processedTemperatures addObject:processedTemperature];
        [processedTemperature release];
    }
    
    for (Temperature *processedTemperature in processedTemperatures) {
        NSLog(@"%gºF, %gºC, %gK", [processedTemperature fahrenheitTemperature], [processedTemperature celsiusTemperature], [processedTemperature kelvinTemperature]);
    }

    
    [processedTemperatures release];
    [flagProcessor release];
    [pool drain];
    return 0;
}

