//
//  BrowseView.m
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import "BrowseView.h"
#import "JSONParser.h"


@implementation BrowseView
@synthesize categoryTbl,CategoriesArray,catrgoriesNameArray;

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CategoriesArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
    
    [catrgoriesNameArray sortUsingSelector:@selector(caseInsensitiveCompare:)];
    
    
    cell.textLabel.text = [catrgoriesNameArray objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Faizan
    
    Find_Me_That_PlantAppDelegate *appDel=[[UIApplication sharedApplication]delegate];
    appDel.catrgoryIdStr=  [[CategoriesArray objectAtIndex:indexPath.row]valueForKey:@"id"];
    appDel.flagChkBrowseCategory=1;
    
    //Old
    
	if(SearchVwObj){
		SearchVwObj =nil;
		[SearchVwObj release];
	}
    SearchVwObj = [[SearchView alloc] initWithNibName:@"SearchView" bundle:nil];
    [self.navigationController pushViewController:SearchVwObj animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	[cell setBackgroundColor:[UIColor colorWithPatternImage: [UIImage imageNamed: @"nurserycell.png"]]];
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */






#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    categoryTbl.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"nurserycell.png"]];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 150,100)];
	titleLabel.font = [UIFont boldSystemFontOfSize: 16.0f];
	titleLabel.textAlignment = UITextAlignmentCenter;
	titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.textColor = [UIColor blackColor];
	titleLabel.text = @"Search Genra";
    self.navigationItem.titleView=titleLabel;
    self.title = @"Search Genra";

    
    
   CategoriesArray = [[NSMutableArray alloc] init];
    [self JSON];
 	
    // Do any additional setup after loading the view from its nib.
}

-(void)JSON{
    
    [AlertHandler showAlertForProcess];
    NSString *browsCatagoryUrl = @"http://findmethatplant.com/nurseries/web_services/list_category.php";
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:browsCatagoryUrl]];
	JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(searchResult:) andHandler:self];
	NSLog(@"Parser  %@",parser); 

}

-(void)searchResult:(NSDictionary*)dictionary
{
	[AlertHandler hideAlert];
//	NSLog(@"Dictinary  %@",dictionary);
    CategoriesArray = [[dictionary valueForKey:@"categorys"]retain];
       catrgoriesNameArray=[[NSMutableArray alloc]init];
     int i;
    
       for (i=0; i<=([CategoriesArray count]-1); i++) 
       {
        NSString *tempCategory;
        tempCategory = [[[CategoriesArray objectAtIndex:i]valueForKey:@"Category"]retain];
        [catrgoriesNameArray addObject:tempCategory];
       tempCategory=nil;
       }
    
    
  //  NSLog(@"%@",catrgoriesNameArray);
    [categoryTbl reloadData];
}

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

- (void)dealloc {
    [super dealloc];
    [catrgoriesNameArray release];
    [CategoriesArray release];   
}




@end
