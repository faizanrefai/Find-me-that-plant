//
//  OpeningTimesView.m
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import "OpeningTimesView.h"

@implementation OpeningTimesView
@synthesize dictinoryObj;
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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Opening times";
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    for (NSString *key in dictinoryObj) 
    {
        NSMutableArray *array = [dictinoryObj valueForKey:@"nursery"];
        
        for (NSDictionary *item in array)
        {
            detailTextView.text=[NSString stringWithFormat: @"%@",[item objectForKey:@"Opening_Times"] ]; 
        }
    }
    
}
-(void)setDictinory:(id)sender{
    
    dictinoryObj = [[NSMutableDictionary alloc]init];
    dictinoryObj=[sender mutableCopy];
    
}

- (void)viewDidUnload
{
    [detailTextView release];
    detailTextView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [detailTextView release];
    [super dealloc];
}
@end
