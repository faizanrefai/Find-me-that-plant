//
//  websiteview.m
//  Find Me That Plant
//
//  Created by apple on 12/16/11.
//  Copyright 2011 fgbfg. All rights reserved.
//

#import "websiteview.h"
#import "AlertHandler.h"


@implementation websiteview


@synthesize urlAddress;



// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
   // [AlertHandler showAlertForProcess];	

    [super viewDidLoad];
	
    NSURL *url = [NSURL URLWithString:self.urlAddress];
//	NSURL *url = [NSURL URLWithString:@"http://sandbox.fsenet.com/FSEMobileServices/sellSheet"];
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//Load the request in the UIWebView.
	[myWeb loadRequest:requestObj];

}

-(void)set_url:(NSString*)page_url
{
    urlAddress=[[[NSMutableString alloc]initWithString:page_url]retain];
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
	
   // [AlertHandler hideAlert];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
	//[AlertHandler showAlertForProcess];	
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
	
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

//	[AlertHandler hideAlert];
}


-(IBAction)btn_closedClicked
{
    [myWeb stopLoading];
    [self webViewDidFinishLoad:nil];
    [myWeb release];
	[self dismissModalViewControllerAnimated:YES];
	
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

-(void)viewWillDisappear:(BOOL)animated{


}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    
    [urlAddress release];
    [super dealloc];
}


@end
