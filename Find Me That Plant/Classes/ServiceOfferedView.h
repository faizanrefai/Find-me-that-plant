//
//  ServiceOfferedView.h
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceOfferedView : UIViewController {
    NSMutableDictionary *dictinoryObj;
    UITextView *detailTextView;
}
@property (nonatomic, retain) IBOutlet UITextView *detailTextView;

@property (nonatomic, retain)    NSMutableDictionary *dictinoryObj;


-(void)setDictinory:(id)sender;

@end
