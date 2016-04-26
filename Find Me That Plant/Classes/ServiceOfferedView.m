//
//  ServiceOfferedView.m
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import "ServiceOfferedView.h"

@implementation ServiceOfferedView
@synthesize detailTextView;
@synthesize dictinoryObj;

- (void)dealloc {
    [dictinoryObj release];
    [detailTextView release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


-(void)setDictinory:(id)sender{
   
    dictinoryObj = [[NSMutableDictionary alloc]init];
    dictinoryObj=[sender mutableCopy];
    
}



#pragma mark - View lifecycle

-(void)viewWillAppear:(BOOL)animated{

    detailTextView.text=[[[[dictinoryObj valueForKey:@"nursery"]objectAtIndex:0] valueForKey:@"About_Us"] retain] ;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Services offered";

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setDetailTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
