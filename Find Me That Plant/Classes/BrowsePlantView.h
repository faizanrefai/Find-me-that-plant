//
//  BrowsePlantView.h
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlantDataView.h"

@class PlantDataView;
@interface BrowsePlantView : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *PlantTbl;
    PlantDataView *plantDataObj;
    NSMutableArray *PlantsArray;
}

@property (nonatomic, retain) NSMutableArray *PlantsArray;
@property (nonatomic, retain) UITableView *PlantTbl;
@end
