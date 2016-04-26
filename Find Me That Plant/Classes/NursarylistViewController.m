//
//  NursarylistViewController.m
//  Find Me That Plant
//
//  Created by Openxcelltech on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NursarylistViewController.h"

@implementation NursarylistViewController


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	nursery=[[NSMutableArray alloc]init];
	appdelObj =(Find_Me_That_PlantAppDelegate*)[[UIApplication sharedApplication] delegate];

    self.navigationItem.title = @"Nurseries";
   myTable.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"nurserycell.png"]];

	self.navigationController.navigationBar.tintColor=[UIColor colorWithRed:0.2 green:0.5 blue:0.0 alpha:1.0];
	// Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {

	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 100,100)];
	titleLabel.font = [UIFont boldSystemFontOfSize: 18.0f];
	titleLabel.textAlignment = UITextAlignmentCenter;
	titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.textColor = [UIColor blackColor];
	titleLabel.text = @"Nurseries";
	[self getnursery_list];
	
	self.navigationItem.titleView=titleLabel;
}

-(void)getnursery_list{
	[AlertHandler showAlertForProcess];
	NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://findmethatplant.com/nurseries/web_services/list_nurserys.php"]];
	JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(searchResult:) andHandler:self];
	NSLog(@"%@",parser);
	
}

-(void)searchResult:(NSDictionary*)dictionary{
	[AlertHandler hideAlert];
	[nursery removeAllObjects];
//	NSLog(@"%@",dictionary);
	nursery =[[dictionary valueForKey:@"nursery_list"]mutableCopy];	
	[myTable reloadData];
}	

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [nursery count];
	//NSLog(@"%@",[nursery count]);
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	NSString *str=[NSString stringWithFormat:@"%@",[[nursery objectAtIndex:indexPath.row] valueForKey:@"Nursery_Name"]];
    
	// Configure the cell.
    cell.textLabel.text = [NSString stringWithFormat:@"%@",str];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(nursaryViewObj!= nil){
        nursaryViewObj =nil;
    [nursaryViewObj release];
    }
	NSMutableString *passed_str=[NSMutableString stringWithFormat:@"%@",[[nursery objectAtIndex:indexPath.row] valueForKey:@"User_Id"]];
	
    appdelObj.userId = [passed_str retain];
    
    nursaryViewObj =[[NurseryView alloc]initWithNibName:@"NurseryView" bundle:nil];
    [self.navigationController pushViewController:nursaryViewObj animated:YES];

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	//[cell setBackgroundColor:[UIColor colorWithPatternImage: [UIImage imageNamed: @"cellbackground.png"]]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
