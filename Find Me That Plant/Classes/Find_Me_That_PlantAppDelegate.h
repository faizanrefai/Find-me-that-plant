//
//  Find_Me_That_PlantAppDelegate.h
//  Find Me That Plant
//
//  Created by APPLE  on 12/3/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Find_Me_That_PlantAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    IBOutlet UITabBarController *tabbar;
    UINavigationController *navigationController;
	int pushcount;
    
    //Faizan
    
    NSString *catrgoryIdStr;
    int flagChkBrowseCategory;
    NSMutableString *plantIDStr;
    NSMutableString *userId;
    
    NSString *strurl;
    

}
@property (nonatomic,retain)NSString *strurl;

@property (nonatomic)int pushcount;
@property (nonatomic, retain)  UITabBarController *tabbar;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

//Faizan
@property (nonatomic,retain) NSString *catrgoryIdStr;
@property int flagChkBrowseCategory;
@property (nonatomic,retain)    NSMutableString *plantIDStr;
@property (nonatomic,retain)    NSMutableString *userId;


@end

