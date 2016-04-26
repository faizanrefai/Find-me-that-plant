//
//  SpecialOffersView.h
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialOffersView : UIViewController{

    NSMutableDictionary *dictinoryObj;
    IBOutlet UITextView *detailTextView;

    
    

}

@property (nonatomic, retain)    NSMutableDictionary *dictinoryObj;



-(void)setDictinory:(id)sender;

@end
