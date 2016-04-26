//
//  websiteview.h
//  Find Me That Plant
//
//  Created by apple on 12/16/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertHandler.h"
#import "Find_Me_That_PlantAppDelegate.h"

@interface websiteview : UIViewController <UIWebViewDelegate>{

    Find_Me_That_PlantAppDelegate *appDel;
	IBOutlet UIWebView* myWeb;
	AlertHandler *alt;
	NSMutableString *urlAddress;
	
}

-(IBAction)btn_closedClicked;
-(void)set_url:(NSString*)page_url;

@property(nonatomic,retain)NSMutableString *urlAddress;
@end
