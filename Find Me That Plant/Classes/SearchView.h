//
//  SearchView.h
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlantDataView.h"
#import "InvitationInfo.h"
#import "websiteview.h"
#import "JSONParser.h"
#import "RootViewController.h"
#import "EGOImageView.h"

@class PlantDataView,InvitationInfo;
@interface SearchView : UIViewController<UIAlertViewDelegate,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    InvitationInfo *invitationInfoObj;
    PlantDataView *plantDataObj;
    IBOutlet UITableView *DataTbl;
    NSMutableArray *MainPlantArray;
    IBOutlet UISearchBar *searchbar;
	NSMutableArray *PlantsArray;
	NSMutableArray *plant_namelist;
	NSMutableArray *planting_list;
	NSMutableArray *flowering_list;
	NSMutableArray *soil_list;
	NSMutableArray *hardiness_list;
	NSMutableArray *planturl_list;
	NSMutableArray *flickrPhotos;
    NSMutableArray *plantIdArray;
	IBOutlet UILabel *plant_name;
	IBOutlet UILabel *planting;
	IBOutlet UILabel *flowering;
	IBOutlet UILabel *soil;
	IBOutlet UILabel *hardiness;
	IBOutlet UIButton *buy;
	IBOutlet UIButton *info;
	IBOutlet UIImageView *imgview;
	NSString *url_str;
	IBOutlet UITableViewCell *tvcell;
	IBOutlet EGOImageView *imageView;
	
}

-(void)JSON;
-(IBAction)BuyClicked:(id)sender;
-(IBAction)InviteClicked:(id)sender;
//-(IBAction)closeView:(id)sender;


@property (nonatomic,retain)UITableViewCell *tvcell;
@property (nonatomic, retain)  UISearchBar *searchbar;
@property (nonatomic, retain) NSMutableArray *PlantsArray;
@property (nonatomic, retain) NSMutableArray *MainPlantArray;
@property (nonatomic, retain) UITableView *DataTbl;


// Faizan

-(void)jsonBrowse;


@end
