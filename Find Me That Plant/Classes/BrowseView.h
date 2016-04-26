//
//  BrowseView.h
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrowsePlantView.h"
#import "SearchView.h"
#import "Find_Me_That_PlantAppDelegate.h"

@class BrowsePlantView,SearchView;
@interface BrowseView : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    SearchView *SearchVwObj;
    IBOutlet UITableView *categoryTbl;
    BrowsePlantView *BrowsePlantObj;
    NSMutableArray *CategoriesArray;
   
    // Faizan
    
    NSMutableArray *catrgoriesNameArray;
    
    
}

@property (nonatomic, retain) NSMutableArray *CategoriesArray;
@property (nonatomic, retain)  UITableView *categoryTbl;

//  Faizan

@property (nonatomic,retain) NSMutableArray *catrgoriesNameArray;
-(void)JSON;

@end
