//
//  EffAppDelegate.m
//  ColorPicker
//
//  Created by eff-mac-002 on 10/5/13.
//  Copyright (c) 2013 Efftronics Systems Pvt. Ltd. All rights reserved.
//

#import "EffAppDelegate.h"

@implementation EffAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    uint16_t x= 120; //2 byte unsigned int (0000 0000 0111 1000)
    //You need 13th bit to be 1
    x<<=1; //Shift bits to left .(x= 0000 0000 1111 0000)
    x|=1; //OR with 1 (x= 0000 0000 1111 0001)
    //14th bit to be 0.
    x<<=1; // (x=0000 0001 1110 0010)
    //15th bit to be 1
    x<<=1; //x= 0000 0011 1100 0100
    x|=1;  //x= 0000 0011 1100 0101
    //16th bit to be 1
    x<<=1; //x= 0000 0111 1000 1010
    x|=1;  //x= 0000 0111 1000 1011
    
    //Now convert x into NSData
    /** **** Replace this for Big Endian ***************/
//    NSMutableData *data = [[NSMutableData alloc] init];
//    int MSB = x/256;
//    int LSB = x%256;
//    [data appendBytes:&MSB length:1];
//    [data appendBytes:&LSB length:1];
    
    /** **** ********************* ***************/
    //replace with :
    NSMutableData *data = [[NSMutableData alloc] initWithBytes:&x length:sizeof(x)];
    NSLog(@"%@",[data description]);
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
