//
//  NursarylistViewController.h
//  Find Me That Plant
//
//  Created by Openxcelltech on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NurseryView.h"
#import "JSONParser.h"
#import "Find_Me_That_PlantAppDelegate.h"

@interface NursarylistViewController : UIViewController{
    IBOutlet UITableView *myTable;
    NurseryView *nursaryViewObj;
	NSMutableArray *nursery;
	NSMutableArray *nursery_id;
Find_Me_That_PlantAppDelegate *appdelObj;
	
}
-(void)getnursery_list;
@end
