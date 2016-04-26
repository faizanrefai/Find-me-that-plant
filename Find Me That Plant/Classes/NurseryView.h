//
//  NurseryView.h
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceOfferedView.h"
#import "SpecialOffersView.h"
#import "Locations.h"
#import "OpeningTimesView.h"
#import "ExhibitionsShowsView.h"
#import "PlantDataView.h"
#import "InvitationInfo.h"
#import "websiteview.h"
#import "JSONParser.h"
#import "EGOImageView.h"
#import "Find_Me_That_PlantAppDelegate.h"
 
@class PlantDataView,InvitationInfo;
@interface NurseryView : UIViewController<UITableViewDelegate,EGOImageViewDelegate>
{
    IBOutlet UILabel *nursaryNameLbl;
    InvitationInfo *invitationInfoObj;
    PlantDataView *plantDataObj;
    ServiceOfferedView *ServicesOffVwObj;
    SpecialOffersView *SpecialOffersVwObj;
    Locations *LocationsObj;
    OpeningTimesView *OpeningTimesVwObj;
    ExhibitionsShowsView *ExhibitionShowObj;
	Find_Me_That_PlantAppDelegate *appdelObj;
    NSMutableArray *PlantsArray;
	NSMutableArray *plant_namelist;
	NSMutableArray *planting_list;
	NSMutableArray *flowering_list;
	NSMutableArray *soil_list;
	NSMutableArray *hardiness_list;
	NSMutableArray *planturl_list;
	NSMutableArray *flickrPhotos;
	NSMutableDictionary *nurseryDetailDic;
    IBOutlet UILabel *plant_name;
	IBOutlet UILabel *planting;
	IBOutlet UILabel *flowering;
	IBOutlet UILabel *soil;
	IBOutlet UILabel *hardiness;
	IBOutlet UIButton *buy;
	IBOutlet UIButton *info;
	IBOutlet UIImageView *imgview;
	NSString *url_str;
    IBOutlet UITableView *PlantTbl;
	IBOutlet UITableViewCell *tvcell;
	IBOutlet EGOImageView *imageView;
	
	IBOutlet UIButton *web;
	IBOutlet UIButton *service;
	IBOutlet UIButton *location;
	IBOutlet UIButton *offers;
	IBOutlet UIButton *Exhibition;
	IBOutlet UIButton *Opening;
}
@property (nonatomic,retain)UITableViewCell *tvcell;
@property (nonatomic, retain)  UITableView *PlantTbl;
@property (nonatomic, retain) NSMutableArray *PlantsArray;
@property (nonatomic, retain)	NSMutableDictionary *nurseryDetailDic;



- (void)setFlickrPhoto:(NSString*)flickrPhoto;
-(void)GetNurseryPlant_detail;
-(IBAction)urlClicked:(id)sender;
-(IBAction)Servicesoffered:(id)sender;
-(IBAction)Specialoffers:(id)sender;
-(IBAction)Locations:(id)sender;
-(IBAction)Openingtimes:(id)sender;
-(IBAction)ExhibitionsandShows:(id)sender;
-(IBAction)BuyClicked:(id)sender;
-(IBAction)InviteClicked:(id)sender;

@end
