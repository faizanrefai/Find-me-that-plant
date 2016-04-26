//
//  SearchView.m
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import "SearchView.h"
#import "JSONParser.h"
#import "RootViewController.h"
#import "EGOImageView.h"
#import "Find_Me_That_PlantAppDelegate.h"
#import "BrowseView.h"

@implementation SearchView
@synthesize DataTbl,PlantsArray,MainPlantArray,searchbar,tvcell;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
   // self.title = @"Plants";
    [super viewDidLoad];
         
	// Faizan 
    
    Find_Me_That_PlantAppDelegate *appDel = [[UIApplication sharedApplication]delegate];
    
    if (appDel.flagChkBrowseCategory==0) {
    [self JSON];

    }else if (appDel.flagChkBrowseCategory==1) {
        
        [self jsonBrowse];
        
    }
    
//  Old

    DataTbl.backgroundColor=[UIColor colorWithRed:0.2 green:0.5 blue:0.0 alpha:1.0];
    DataTbl.rowHeight = 110.0;
	UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"cellbackground.png"]];
	self.view.backgroundColor= background;  

    // Do any additional setup after loading the view from its nib.
}

-(void)jsonBrowse{
    
    Find_Me_That_PlantAppDelegate *appDel = [[UIApplication sharedApplication]delegate];


    [AlertHandler showAlertForProcess];
    NSString *urlCategory = [NSString stringWithFormat:@"http://findmethatplant.com/nurseries/web_services/get_plant_by_category.php?Cid=%@",appDel.catrgoryIdStr];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlCategory]];
	JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(searchResult:) andHandler:self]; 
    NSLog(@"%@",parser);
    appDel.flagChkBrowseCategory=0;

}

- (void)viewWillAppear:(BOOL)animated {
	
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 100,100)];
	titleLabel.font = [UIFont boldSystemFontOfSize: 18.0f];
	titleLabel.textAlignment = UITextAlignmentCenter;
	titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.textColor = [UIColor blackColor];
	titleLabel.text = @"Plants";
	self.navigationItem.titleView=titleLabel;
	
}

-(void)JSON
{
	[AlertHandler showAlertForProcess];
	NSString *user_search = [[NSUserDefaults standardUserDefaults]valueForKey:@"searchkey"];
	NSString *str_planturl=[NSString stringWithFormat:@"http://findmethatplant.com/nurseries/web_services/search_palnt.php?key=%@",user_search];
	NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str_planturl]];
	JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(searchResult:) andHandler:self];
	NSLog(@"%@",parser);
}


-(void)searchResult:(NSDictionary*)dictionary
{

    [AlertHandler hideAlert];
  //  NSLog(@"%@",dictionary);
	PlantsArray=[[dictionary valueForKey:@"Plants"]retain];
	plant_namelist=[[[dictionary valueForKey:@"Plants"]valueForKey:@"Plant_Name"] retain];
	planting_list=[[[dictionary valueForKey:@"Plants"]valueForKey:@"Planting"] retain];
	flowering_list=[[[dictionary valueForKey:@"Plants"]valueForKey:@"Flowering"] retain];
	soil_list=[[[dictionary valueForKey:@"Plants"]valueForKey:@"Soil_Type"] retain];
	hardiness_list=[[[dictionary valueForKey:@"Plants"]valueForKey:@"Hardiness"] retain];
	planturl_list=[[[dictionary valueForKey:@"Plants"]valueForKey:@"Plant_Url"] retain];
	flickrPhotos=[[[dictionary valueForKey:@"Plants"]valueForKey:@"Main_Image_Url"]retain];
    plantIdArray=[[[dictionary valueForKey:@"Plants"]valueForKey:@"Plant_Id"]retain];
    
    if ([PlantsArray count]==0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"No Plants Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        alert.tag=1;
        [alert release];
    }
    
    
    [DataTbl reloadData];
}	
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    [self.navigationController popViewControllerAnimated:YES];

}
- (void)viewDidUnload
{
    [super viewDidUnload];
    
    Find_Me_That_PlantAppDelegate *appDel = [[UIApplication sharedApplication]delegate];
    appDel.flagChkBrowseCategory=0;
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)searchwithKeyWord:(UISearchBar*)SearchB{
		
		[PlantsArray removeAllObjects];
    		
    NSString *str_planturl=[NSString stringWithFormat:@"http://findmethatplant.com/nurseries/web_services/search_palnt.php?key=%@",SearchB.text];
	NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str_planturl]];
	JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(searchResult:) andHandler:self];
    NSLog(@"%@",parser);

    
//    NSDictionary *dic1;
//		for(dic1 in MainPlantArray)
//		{
//			NSString *st =	[dic1 copy];
//			NSRange rang =[st rangeOfString:SearchB.text options:NSCaseInsensitiveSearch];
//			if (rang.length == [SearchB.text length]) {
//				[PlantsArray addObject:dic1];
//			}else {
//				[PlantsArray removeObject:dic1];
//			}
//		}
        
     
    [DataTbl reloadData];
}


-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
	[searchBar setShowsCancelButton:YES animated:YES];
	searchBar.showsCancelButton=YES;
	return YES;
}
-(BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    
    [self performSelector:@selector(searchwithKeyWord:) withObject:searchBar afterDelay:0.2];
	return YES;
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
	[searchBar setShowsCancelButton:NO animated:YES];
	[searchBar resignFirstResponder];
	
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
	[searchBar resignFirstResponder];
	[searchBar setShowsCancelButton:NO animated:YES];
}
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
	
	[self searchwithKeyWord:searchBar];
	return YES;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [PlantsArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier ";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CustomCellIdentifier];
	if (cell == nil) 
	{ 
		[[NSBundle mainBundle] loadNibNamed:@"SearchCustomCell" owner:self options:nil];
		cell=self.tvcell;
		self.tvcell=nil;
		//UIImage *buyImage = [UIImage imageNamed:@"buybutton.png"];
		//[buy setBackgroundImage:buyImage forState:UIControlStateNormal];
		
		//UIImage *infoImage = [UIImage imageNamed:@"infobutton.png"];

		//[info setBackgroundImage:infoImage forState:UIControlStateNormal];
	}

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    url_str=[[NSString stringWithFormat:@"%@",[planturl_list objectAtIndex:indexPath.row]] retain];
	
    info.tag = indexPath.row;
    
    [buy addTarget:self action:@selector(BuyClicked:) forControlEvents:UIControlEventTouchUpInside];
    [info addTarget:self action:@selector(InviteClicked:) forControlEvents:UIControlEventTouchUpInside];
	NSString *str1=[NSString stringWithFormat:@"%@",[plant_namelist objectAtIndex:indexPath.row]];
	NSString *planting_str=[NSString stringWithFormat:@"%@",[planting_list objectAtIndex:indexPath.row]];
	plant_name.text=str1;
	planting.text=planting_str;
	
	NSString *flowering_str=[NSString stringWithFormat:@"%@",[flowering_list objectAtIndex:indexPath.row]];
	flowering.text=flowering_str;
	
	NSString *hardiness_str=[NSString stringWithFormat:@"%@",[hardiness_list objectAtIndex:indexPath.row]];
	hardiness.text=hardiness_str;
	
	NSString *soil_str=[NSString stringWithFormat:@"%@",[soil_list objectAtIndex:indexPath.row]];
	soil.text=soil_str;
	
	NSString *url_string=[NSString stringWithFormat:@"%@",[flickrPhotos objectAtIndex:indexPath.row]];
    
	
	NSURL *url=[[NSURL alloc]initWithString:url_string];
	//	imageView.image =[geURL:[flickrPhotos objectAtIndex:indexPath.row]];
	[imageView setImageURL:url];
	//imgview=imageView;
	[cell.contentView addSubview:imageView];
	return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(invitationInfoObj){
		invitationInfoObj =nil;
		[invitationInfoObj release];
	} 
    
   
    Find_Me_That_PlantAppDelegate *appDel = [[UIApplication sharedApplication]delegate];
    appDel.plantIDStr= [plantIdArray objectAtIndex:indexPath.row];
    invitationInfoObj = [[InvitationInfo alloc] initWithNibName:@"InvitationInfo" bundle:nil];
    [self.navigationController pushViewController:invitationInfoObj animated:YES];
  
    
}



-(IBAction)BuyClicked:(id)sender
{
	websiteview *obj_web = [[websiteview alloc]init];
	
	[obj_web set_url:url_str];
	
	[self presentModalViewController:obj_web animated:YES];
}

-(IBAction)InviteClicked:(id)sender
{
   //Faizan
    UIButton *btn = (UIButton *)sender;
    Find_Me_That_PlantAppDelegate *appDel = [[UIApplication sharedApplication]delegate];

    appDel.plantIDStr= [plantIdArray objectAtIndex:btn.tag];
    invitationInfoObj = [[InvitationInfo alloc] initWithNibName:@"InvitationInfo" bundle:nil];
    [self.navigationController pushViewController:invitationInfoObj animated:YES];
}


@end
