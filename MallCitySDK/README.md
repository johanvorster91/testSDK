# Entersekt

Entersekt app

# How to use

Open your app project. 
Go to target app in .xcodeproj file, then on General tab, search for Embed binaries section, click on +embed binaries, and then click on Add Other option on opened dialog. 
Locate your .framework file, and add it. 
Check tick on Copy items if needed option, it will copy your .framework file in other required sections.

Also, go to your Build Settings tab of your app project, mention the path of framework project (where .framework file is present) in ‘Framework Search Paths’ setting.

import the following:


#import <MallCitySDK/MallAndCityHttp.h>

#import <MallCitySDK/MallAndCityUtil.h>

MallAndCityHttp* httpRequest = [[MallAndCityHttp alloc] init];
MallAndCityUtil* util [[MallAndCityUtil alloc] init];


# To get all to information from webserivce (ps if no data is return from server the last succeessful data will be used)

-(void) setData:(NSMutableDictionary *) data;
[util setData:[httpRequest request:@"http://www.mocky.io/v2/5b7e8bc03000005c0084c210"]];


# Request a list of cities.

[util getCities:nil]

# Request a particular city.

[util getCities:@"Johannesburg"]

# Request a list of malls in a city.

[util getMalls:@"Cape Town" :nil]

# Request a particular mall in a city.

[util getMalls:@"Cape Town" :@"Century City"]

# Request a list of shops in a mall.

[util getShops:@"Cape Town" :nil]

# Request a particular shop in a mall.

[util getShops:@"Cape Town" :@"Nespresso"]

# Request a list of shops in a city.

[util getCityShops:@"Cape Town"]
