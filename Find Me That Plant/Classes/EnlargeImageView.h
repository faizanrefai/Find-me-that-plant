//
//  EnlargeImageView.h
//  Find Me That Plant
//
//  Created by openxcell121 on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOEnlargeView.h"

@interface EnlargeImageView : UIViewController
@property (retain, nonatomic) IBOutlet EGOEnlargeView *imageViw;
@property(retain,nonatomic)NSURL *imageZoom;

- (void)setUrlImage:(NSURL *)imageViw1 ;

@end
