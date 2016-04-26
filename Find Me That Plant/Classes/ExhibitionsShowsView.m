//
//  ExhibitionsShowsView.m
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import "ExhibitionsShowsView.h"

@implementation ExhibitionsShowsView
@synthesize detailTextView;
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
    
  //  NSLog(@"%@",dictinoryObj);
    
    for (NSString *key in dictinoryObj) 
    {
        NSMutableArray *array = [dictinoryObj valueForKey:@"nursery"];
        
        for (NSDictionary *item in array)
        {
            NSMutableArray *array1 =  [item objectForKey:@"News"];
            NSMutableArray *tempArray=[[NSMutableArray alloc]init];
            
            for (NSDictionary *item in array1) {
                
                [tempArray addObject:[NSString stringWithFormat:@"%@",[item objectForKey:@"title"]]];
            }
            
             detailTextView.text = [detailTextView.text stringByAppendingFormat:@"        ----Exhibitions News----\n"];
            
            for(NSString *str in tempArray)
            {
                detailTextView.text = [detailTextView.text stringByAppendingFormat:@" \n *   %@.\n",str];
            }
            
            [tempArray release];
            
            
            NSMutableArray *array2 =  [item objectForKey:@"Shows"];
            NSMutableArray *tempArray1=[[NSMutableArray alloc]init];
            
            for (NSDictionary *item in array2) {
                
                [tempArray1 addObject:[NSString stringWithFormat:@"%@",[item objectForKey:@"title"]]];
            }
            
             detailTextView.text = [detailTextView.text stringByAppendingFormat:@"\n\n        ----Shows----\n"];
            
            for(NSString *str in tempArray1)
            {
                detailTextView.text = [detailTextView.text stringByAppendingFormat:@" \n *   %@.\n",str];
            }
            
            [tempArray1 release];
        }
    }
   
   
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Exhibitions and Shows";
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

- (void)dealloc {
    [detailTextView release];
    [super dealloc];
}
@end
