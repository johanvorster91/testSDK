//
//  MallAndCityHttp.m
//  MallAndCityApp
//
//  Created by Admin on 2018/11/28.
//  Copyright © 2018 Johan Vorster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MallAndCityHttp.h"
#import "MallAndCityUtil.h"
@implementation MallAndCityHttp

-(NSMutableDictionary *) request:(NSString *) url{
    NSMutableDictionary *allData;
    NSString  *dictPath;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    if ([paths count] > 0)
    {
        // Path to save dictionary
        dictPath = [[paths objectAtIndex:0]
                    stringByAppendingPathComponent:@"dict.out"];
        // Write dictionary
        
    }
    @try {
        NSError *error;
        NSURL *currentUrl = [NSURL URLWithString:url];
        NSData *data = [NSData dataWithContentsOfURL:currentUrl];
        allData = [NSJSONSerialization
                                        JSONObjectWithData:data
                                        options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves
                                        error:&error];
        [allData writeToFile:dictPath atomically:YES];
    }
    @catch (NSException *exception) {       
        
        NSDictionary *dictFromFile = [NSDictionary dictionaryWithContentsOfFile:dictPath];
        allData = [dictFromFile mutableCopy];
    }
    @finally {
        
        return allData;
    }
}

@end
