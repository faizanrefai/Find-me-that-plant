//
//  RootViewController.m
//  Find Me That Plant
//
//  Created by APPLE  on 12/3/11.
//  Copyright 2011 openxcel. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController
@synthesize myTextField;



#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Plants";
	self.navigationController.navigationBar.tintColor=[UIColor colorWithRed:0.3 green:0.6 blue:0.0 alpha:1.0];
	//UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"rootview_background.png"]];
	//self.view.backgroundColor= background;
	//[background release];
	UIImage *searchImage = [UIImage imageNamed:@"searchtext.png"];
    [mysearchButton setBackgroundImage:searchImage forState:UIControlStateNormal];
	//UIImage *browseImage=[UIImage imageNamed:@"browse.png"];
	//[browsebutton setBackgroundImage:browseImage forState:UIControlStateNormal];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 100,100)];
	titleLabel.font = [UIFont boldSystemFontOfSize: 18.0f];
	titleLabel.textAlignment = UITextAlignmentCenter;
	titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.textColor = [UIColor blackColor];
	titleLabel.text = @"Plants";
	self.navigationItem.titleView=titleLabel;
	
	
}

-(IBAction)onsearchBtn:(id)sender{
	
    [mysearchtext resignFirstResponder];
    
	//mysearchview.hidden =TRUE;
    //[mysearchtext resignFirstResponder];
	NSString *search_string=mysearchtext.text;
	
    if ([search_string length]>0) {

    [[NSUserDefaults standardUserDefaults] setValue:search_string forKey:@"searchkey"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	searchVwObj = [[SearchView alloc] initWithNibName:@"SearchView" bundle:nil];
    [self.navigationController pushViewController:searchVwObj animated:YES];
    
    }else{
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Warning" message:@"Please insert text to search." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    
    }
}



-(IBAction)SearchText:(id)sender
{
    // mysearchview.hidden =FALSE;
//    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Search text" message:@"\n\n\n" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
//    myAlertView.tag=101;
//    myTextField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
//    myTextField.placeholder=@"Enter User Name";
//    
//     myTextField.delegate = self;
//    
//    [myTextField becomeFirstResponder];
//    [myTextField setBackgroundColor:[UIColor whiteColor]];
//    myTextField.textAlignment=UITextAlignmentCenter;
//
//       
//    [myAlertView addSubview:myTextField];
//      [myAlertView show];
//    [myAlertView release];
    
   
}

-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [myTextField resignFirstResponder];
        searchVwObj = [[SearchView alloc] initWithNibName:@"SearchView" bundle:nil];
        [self.navigationController pushViewController:searchVwObj animated:YES];
    }
   
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [mysearchtext resignFirstResponder];
    return YES;
}

-(IBAction)BrowseCategory:(id)sender
{
	if(BrowseVwObj){
		BrowseVwObj =nil;
		[BrowseVwObj release];
	}
    BrowseVwObj = [[BrowseView alloc] initWithNibName:@"BrowseView" bundle:nil];
    [self.navigationController pushViewController:BrowseVwObj animated:YES];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*

 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 
*/



#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

