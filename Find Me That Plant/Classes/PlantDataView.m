//
//  PlantDataView.m
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import "PlantDataView.h"

@implementation PlantDataView

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
    
    self.title = @"Florida Sieboldii";
    
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)urlClicked:(id)sender
{
    //NSURL *url = [NSURL URLWithString:@"http://www.portlandnursery.com/"];
	//    
	//    if (![[UIApplication sharedApplication] openURL:url])
	//        NSLog(@"%@%@",@"Failed to open url:",[url description]);
	
	NSString *url_str = @"http://www.portlandnursery.com/";
	
	websiteview *obj_web = [[websiteview alloc]init];
	
	[obj_web set_url:url_str];
	
	[self presentModalViewController:obj_web animated:YES];
	
}


-(IBAction)BuyClicked:(id)sender
{
    //NSURL *url = [NSURL URLWithString:@"http://www.taylorsclematis.co.uk"];
	//    
	//    if (![[UIApplication sharedApplication] openURL:url])
	//        
	//        NSLog(@"%@%@",@"Failed to open url:",[url description]);
	
	NSString *url_str = @"http://www.taylorsclematis.co.uk/clematis-sieboldii.html";
	
	websiteview *obj_web = [[websiteview alloc]init];
	
	[obj_web set_url:url_str];
	
	[self presentModalViewController:obj_web animated:YES];
}


/*
SVWebViewController *webViewController = [[SVWebViewController alloc] initWithAddress:@"http://www.facebook.com/pages/Blackout-Labs/210227459693"];
[self.navigationController pushViewController:webViewController animated:YES];
[webViewController release];

 
 
 
*/

- (void)viewDidUnload
{
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
