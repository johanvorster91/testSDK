//
//  MallAndCityHttp.m
//  MallAndCityApp
//
//  Created by Admin on 2018/11/28.
//  Copyright © 2018 Johan Vorster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MallAndCityUtil.h"


@implementation MallAndCityUtil
@synthesize myDict = _myDict;


-(void) setData:(NSMutableDictionary *) data{
    _myDict = data;
}
//would like to request a list of cities.
//I would like to request a particular city.
-(NSMutableArray *) getCities:(NSString *) city{
    NSMutableArray *theCities = [[NSMutableArray alloc] init];
    for ( NSDictionary *theCity in _myDict[@"cities"] )
    {
        if(city != nil && [theCity[@"name"] isEqualToString:city])
        {
            [theCities addObject:theCity[@"name"]];
        }else if(city == nil)
        {
            [theCities addObject:theCity[@"name"]];
        }
        
    }
    return theCities;
}
//I would like to request a list of malls in a city.
//I would like to request a particular mall in a city.
-(NSMutableArray *) getMalls:(NSString *) selectedCity : (NSString *) selectedMall{
    NSMutableArray *theMalls = [[NSMutableArray alloc] init];
    
    for (NSDictionary *city in _myDict[@"cities"])
    {
        if(selectedCity != nil && [city[@"name"] isEqualToString:selectedCity])
        {
            if(selectedCity != nil)
            {
                for (NSDictionary *mall in city[@"malls"])
                {
                    if(selectedMall != nil && [mall[@"name"] isEqualToString:selectedMall])
                    {
                        [theMalls addObject:mall[@"name"]];
                    }
                }
            }
        }else if(selectedCity == nil)
        {
            [theMalls addObject:city[@"name"]];
        }
    }
    return theMalls;
}

//As a developer, I would like to request a list of shops in a mall.
//As a developer, I would like to request a particular shop in a mall.
-(NSMutableArray *) getShops:(NSString *) selectedMall : (NSString *) selectedShop{
    NSMutableArray *theShops = [[NSMutableArray alloc] init];
    
    for ( NSDictionary *theCity in _myDict[@"cities"])
    {
        NSArray *malls = theCity[@"malls"];
        for ( NSDictionary *theMall in malls )
        {
            if(selectedMall != nil && [theMall[@"name"] isEqualToString:selectedMall])
            {
                NSArray *shops = theMall[@"shops"];
                for ( NSDictionary *theShop in shops )
                {
                    if(selectedShop != nil && [theShop[@"name"] isEqualToString:selectedShop])
                    {
                        [theShops addObject:theShop[@"name"]];
                    }else if(selectedShop == nil)
                    {
                        [theShops addObject:theShop[@"name"]];
                    }
                }
            }else if(selectedMall == nil)
            {
                [theShops addObject:theMall[@"name"]];
            }
        }
    }
    return theShops;
}
//Bonus: As a developer, I would like to request a list of shops in a city.
-(NSMutableArray *) getCityShops:(NSString *) selectedCity
{
    NSMutableArray *theShops = [[NSMutableArray alloc] init];
    for ( NSDictionary *theCity in _myDict[@"cities"])
    {
        if(selectedCity != nil && [theCity[@"name"] isEqualToString:selectedCity])
        {
            NSArray *malls = theCity[@"malls"];
            for ( NSDictionary *theMall in malls )
            {
                NSArray *shops = theMall[@"shops"];
                for ( NSDictionary *theShop in shops )
                {
                     [theShops addObject:theShop[@"name"]];
                }
            }
        }
    }
    return theShops;
}


//NSError *error;
//if( error )
//{
//    NSLog(@"%@", [error localizedDescription]);
//}
//else {
//    NSArray *cities = data[@"cities"];
//    for ( NSDictionary *theCity in cities )
//    {
//        NSLog(@"----");
//        NSLog(@"id: %@", theCity[@"id"] );
//        NSLog(@"name: %@", theCity[@"name"] );
//        NSLog(@"----");
//
//        NSArray *malls = theCity[@"malls"];
//        for ( NSDictionary *theMall in malls )
//        {
//            NSLog(@"----");
//            NSLog(@"id: %@", theMall[@"id"] );
//            NSLog(@"name: %@", theMall[@"name"] );
//            NSLog(@"----");
//
//            NSArray *shops = theMall[@"shops"];
//            for ( NSDictionary *theShops in shops )
//            {
//                NSLog(@"----");
//                NSLog(@"id: %@", theShops[@"id"] );
//                NSLog(@"name: %@", theShops[@"name"] );
//                NSLog(@"----");
//            }
//        }
//    }
//}
@end
