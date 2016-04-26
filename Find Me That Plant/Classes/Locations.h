//
//  Locations.h
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Locations : UIViewController{   
    NSMutableDictionary *dictinoryObj;
    IBOutlet UITextView *detailTextView;
}
-(void)setDictinory:(id)sender;
@property (nonatomic, retain)    NSMutableDictionary *dictinoryObj;


@end
