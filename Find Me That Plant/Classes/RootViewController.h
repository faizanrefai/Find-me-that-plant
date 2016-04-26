//
//  RootViewController.h
//  Find Me That Plant
//
//  Created by APPLE  on 12/3/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchView.h"
#import "BrowseView.h"

@class SearchView,BrowseView;
@interface RootViewController : UIViewController <UIAlertViewDelegate,UITextFieldDelegate>{
    
    SearchView *searchVwObj;
    BrowseView *BrowseVwObj;
   // UITextField *myTextField;
   // IBOutlet UIView *mysearchview;
    IBOutlet UIButton *mysearchButton;
    IBOutlet UIButton *browsebutton;
    IBOutlet UITextField *mysearchtext;
    

}

@property (nonatomic, retain) UITextField *myTextField;
-(IBAction)SearchText:(id)sender;
-(IBAction)BrowseCategory:(id)sender;
-(IBAction)onsearchBtn:(id)sender;

@end
