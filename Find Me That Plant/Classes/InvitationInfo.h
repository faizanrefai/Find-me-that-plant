//
//  InvitationInfo.h
//  Find Me That Plant
//
//  Created by APPLE apple on 12/7/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "websiteview.h"
#import "NurseryView.h"
#import "EGOImageView.h"
#import "Find_Me_That_PlantAppDelegate.h"


@interface InvitationInfo : UIViewController<UIScrollViewDelegate>
{
	Find_Me_That_PlantAppDelegate *appObj;
    IBOutlet UIScrollView *scrollVw;
    //Faizan
    NSString *urlPlantStr;
    IBOutlet UIButton *enlargeImgBtn;
    IBOutlet UILabel *labelDescription;
    IBOutlet EGOImageView *tielsImage3;
    IBOutlet EGOImageView *tielsImage2;
    IBOutlet EGOImageView *tielsImage1;
    IBOutlet EGOImageView *tielsImage4;
    IBOutlet UILabel *labelSizeForThisPrice;
    IBOutlet UILabel *labelPlantName;
    IBOutlet UILabel *labelPuring;
    IBOutlet UILabel *labelHardiness;
    IBOutlet UILabel *labelShippingEst;
    IBOutlet UILabel *labelDeliveryTime;
    IBOutlet UILabel *labelAvailableInVariousSize;
    IBOutlet UILabel *labelPrice;
    IBOutlet UILabel *labelCollection;
    IBOutlet UILabel *labelSoilType;
    IBOutlet UILabel *labelPerennial;
    IBOutlet UILabel *labelHeight;
    IBOutlet UILabel *labelColour;
	IBOutlet UIButton *nurbutton;
	IBOutlet UIButton *buybutton;
	IBOutlet UIButton *nur1button;
	IBOutlet UIButton *buy1button;	
}


@property (nonatomic, retain)  UIScrollView *scrollVw;
@property (nonatomic,retain)    NSURL *urlImageData;

-(IBAction)BuyClicked:(id)sender;
-(IBAction)urlClicked:(id)sender;
-(IBAction)enlargeImage:(id)sender;

//Faizan

@property(nonatomic,retain)IBOutlet UILabel *labelPlantName;
-(void)getplant_detail;

@end
