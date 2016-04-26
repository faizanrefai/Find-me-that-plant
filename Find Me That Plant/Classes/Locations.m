//
//  Locations.m
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import "Locations.h"

@implementation Locations
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
-(void)setDictinory:(id)sender{
    
    dictinoryObj = [[NSMutableDictionary alloc]init];
    dictinoryObj=[sender mutableCopy];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    for (NSString *key in dictinoryObj) 
    {
        NSMutableArray *array = [dictinoryObj valueForKey:@"nursery"];
        
        for (NSDictionary *item in array)
        {
            NSString *tem=[[NSString alloc] initWithString:[item objectForKey:@"Contact"]];
            detailTextView.text= [detailTextView.text stringByAppendingFormat:@"Contact Person: %@",tem];        }
        for (NSDictionary *item in array)
        {
            detailTextView.text=[NSString stringWithFormat: @"\nAddress: %@",[item objectForKey:@"Address"]]; 
        }
        for (NSDictionary *item in array)
        {
            NSString *tem=[[NSString alloc] initWithString:[item objectForKey:@"Email"]];
          detailTextView.text=  [detailTextView.text stringByAppendingFormat:@"\nEmail: %@",tem];
        }
        for (NSDictionary *item in array)
        {
            NSString *tem=[[NSString alloc] initWithString:[item objectForKey:@"Fax"]];
            detailTextView.text= [detailTextView.text stringByAppendingFormat:@"\nFax: %@",tem];        }
        for (NSDictionary *item in array)
        {
            NSString *tem=[[NSString alloc] initWithString:[item objectForKey:@"Tel"]];
            detailTextView.text= [detailTextView.text stringByAppendingFormat:@"\nTel: %@",tem];        }
        for (NSDictionary *item in array)
        {
            NSString *tem=[[NSString alloc] initWithString:[item objectForKey:@"WWW"]];
            detailTextView.text= [detailTextView.text stringByAppendingFormat:@"\nWeb Site: %@",tem];        }

    }
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Locations";
    
    // Do any additional setup after loading the view from its nib.
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
