//
//  NurseryView.m
//  Find Me That Plant
//
//  Created by APPLE apple on 12/3/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import "NurseryView.h"
#import "JSONParser.h"
#import "EGOImageView.h"
#import <QuartzCore/QuartzCore.h>

@implementation NurseryView
@synthesize PlantsArray,PlantTbl,tvcell,nurseryDetailDic;
;

-(void)dealloc{

    [nursaryNameLbl release];
    [super dealloc];
    [nurseryDetailDic release];

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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Nursery";
	appdelObj =(Find_Me_That_PlantAppDelegate*)[[UIApplication sharedApplication] delegate];
    
	PlantTbl.separatorStyle=UITableViewCellSeparatorStyleNone;

	PlantTbl.rowHeight = 110.0;
	PlantTbl.backgroundColor=[UIColor colorWithRed:0.2 green:0.5 blue:0.0 alpha:1.0];
	self.navigationController.navigationBar.tintColor=[UIColor colorWithRed:0.2 green:0.5 blue:0.0 alpha:1.0];
    
    
    [self GetNurseryPlant_detail];
	
	
    
 //   UIImage *buyImage = [UIImage imageNamed:@"leftbutton.png"];
	//UIImage *buyImage = [UIImage imageNamed:@"images.jpg"];

//	[service setBackgroundImage:buyImage forState:UIControlStateNormal];
	
//	UIImage *infoImage = [UIImage imageNamed:@"button.png"];
	//UIImage *infoImage = [UIImage imageNamed:@"images.jpg"];

	
//	[location setBackgroundImage:infoImage forState:UIControlStateNormal];
//	[offers setBackgroundImage:buyImage forState:UIControlStateNormal];
//	[Opening setBackgroundImage:infoImage forState:UIControlStateNormal];
//	[Exhibition setBackgroundImage:buyImage forState:UIControlStateNormal];
//	[web setBackgroundImage:infoImage forState:UIControlStateNormal];
	
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
	
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 100,100)];
	titleLabel.font = [UIFont boldSystemFontOfSize: 18.0f];
	titleLabel.textAlignment = UITextAlignmentCenter;
	titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.textColor = [UIColor blackColor];
	titleLabel.text = @"Nursery";
	
	self.navigationItem.titleView=titleLabel;
//	[self GetNurseryPlant_detail];
}

-(void)GetNurseryPlant_detail {
	
    [AlertHandler showAlertForProcess];

    
	NSString *str_planturl=[NSString stringWithFormat:@"http://findmethatplant.com/nurseries/web_services/list_plants.php?User_Id=%@",appdelObj.userId];
	NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str_planturl]];
	JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(searchResult:) andHandler:self];
	NSLog(@"%@",parser);


    // Get nursury Detail
    
	NSString *str_planturl1=[NSString stringWithFormat:@"http://findmethatplant.com/nurseries/web_services/nursery_profile.php?User_Id=%@",appdelObj.userId];
	NSMutableURLRequest *request1=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str_planturl1]];
	JSONParser *parser1 = [[JSONParser alloc] initWithRequestForThread:request1 sel:@selector(searchResult1:) andHandler:self];
	NSLog(@"%@",parser1);




}

-(void)searchResult:(NSDictionary*)dictionary {
	
   // NSLog(@"%@",dictionary);
	PlantsArray=[[dictionary valueForKey:@"plants"]mutableCopy];
	PlantTbl.separatorStyle=UITableViewCellSeparatorStyleNone;
	if([PlantsArray count]==0){
		CGRect frame = CGRectMake(90,150,150,50);
		UILabel *label = [[UILabel alloc] initWithFrame:frame];
		[self.view addSubview:label];
		[label setText:@"No Plants Available"];
		label.backgroundColor = [UIColor clearColor];
		label.font = [UIFont fontWithName:@"helvetica-Bold" size:17];
		[label release];
        
	}
	else {
		[PlantTbl reloadData];
	}		
}	
-(void)searchResult1:(NSDictionary*)dictionary {
    
    [AlertHandler hideAlert];

   // NSLog(@" Nursury List %@",dictionary);
    nurseryDetailDic = [[NSMutableDictionary alloc]init];
    nurseryDetailDic = [dictionary mutableCopy];
    for (NSString *key in nurseryDetailDic) 
    {
        NSMutableArray *array = [nurseryDetailDic valueForKey:@"nursery"];
        
        for (NSDictionary *item in array)
        {
          nursaryNameLbl.text=  [item objectForKey:@"Nursery_Name"];
        }
        
    }
    

		
}	

-(IBAction)Servicesoffered:(id)sender {
	if(ServicesOffVwObj){
		ServicesOffVwObj =nil;
		[ServicesOffVwObj release];
	}
    ServicesOffVwObj = [[ServiceOfferedView alloc] initWithNibName:@"ServiceOfferedView" bundle:nil];
    [ServicesOffVwObj setDictinory:nurseryDetailDic];
    [self.navigationController pushViewController:ServicesOffVwObj animated:YES];
}

-(IBAction)Specialoffers:(id)sender
{
	if(SpecialOffersVwObj){
		SpecialOffersVwObj =nil;
		[SpecialOffersVwObj release];
	}
    SpecialOffersVwObj = [[SpecialOffersView alloc] initWithNibName:@"SpecialOffersView" bundle:nil];
    [SpecialOffersVwObj setDictinory:nurseryDetailDic];

    [self.navigationController pushViewController:SpecialOffersVwObj animated:YES];
}

-(IBAction)Locations:(id)sender
{
	if(LocationsObj){
		LocationsObj =nil;
		[LocationsObj release];
	}
    LocationsObj = [[Locations alloc] initWithNibName:@"Locations" bundle:nil];
    [LocationsObj setDictinory:nurseryDetailDic];

    [self.navigationController pushViewController:LocationsObj animated:YES];
}

-(IBAction)Openingtimes:(id)sender
{
	if(OpeningTimesVwObj){
		OpeningTimesVwObj =nil;
		[OpeningTimesVwObj release];
	}
    OpeningTimesVwObj = [[OpeningTimesView alloc] initWithNibName:@"OpeningTimesView" bundle:nil];
    [OpeningTimesVwObj setDictinory:nurseryDetailDic];

    [self.navigationController pushViewController:OpeningTimesVwObj animated:YES];
}

-(IBAction)ExhibitionsandShows:(id)sender
{
	if(ExhibitionShowObj){
		ExhibitionShowObj =nil;
		[ExhibitionShowObj release];
	}
    ExhibitionShowObj = [[ExhibitionsShowsView alloc] initWithNibName:@"ExhibitionsShowsView" bundle:nil];
    [ExhibitionShowObj setDictinory:nurseryDetailDic];

    [self.navigationController pushViewController:ExhibitionShowObj animated:YES];
}

-(IBAction)BuyClicked:(id)sender {
    
	websiteview *obj_web = [[websiteview alloc]init];
	
	[obj_web set_url:[url_str retain]];
	
	[self presentModalViewController:obj_web animated:YES];
}

-(IBAction)urlClicked:(id)sender{	
	websiteview *obj_web = [[websiteview alloc]init];
 NSString *tem;
    
    for (NSString *key in nurseryDetailDic) 
    {
        NSMutableArray *array = [nurseryDetailDic valueForKey:@"nursery"];
       
        for (NSDictionary *item in array)
        {
            tem=[[NSString alloc] initWithString:[NSString stringWithFormat:@"http://%@",[item objectForKey:@"WWW"]]];
        }
        
    }
    
    [obj_web set_url:tem];
	
	[self presentModalViewController:obj_web animated:YES];
}

-(IBAction)InviteClicked:(id)sender{  
	if(invitationInfoObj){
		invitationInfoObj =nil;
		[invitationInfoObj release];
	}
	appdelObj.plantIDStr =[NSString stringWithFormat:@"%d",[sender tag]];
    invitationInfoObj = [[InvitationInfo alloc] initWithNibName:@"InvitationInfo" bundle:nil];
    [self.navigationController pushViewController:invitationInfoObj animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)setFlickrPhoto:(NSString*)flickrPhoto {
	imageView.imageURL = [NSURL URLWithString:flickrPhoto];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [PlantsArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier ";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CustomCellIdentifier];
	if (cell == nil){ 
		[[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
		cell=self.tvcell;
		self.tvcell=nil;
	//	UIImage *buyImage = [UIImage imageNamed:@"buybutton.png"];
		//[buy setBackgroundImage:buyImage forState:UIControlStateNormal];		
	//	UIImage *infoImage = [UIImage imageNamed:@"infobutton.png"];		
		//[info setBackgroundImage:infoImage forState:UIControlStateNormal];			
	}
	 cell.selectionStyle = UITableViewCellSelectionStyleNone;
    url_str=[[NSString stringWithFormat:@"%@",[[PlantsArray objectAtIndex:indexPath.row] valueForKey:@"Plant_Url"]]retain];
	info.tag = [[[PlantsArray objectAtIndex:indexPath.row] valueForKey:@"Plant_Id"]intValue];
    [buy addTarget:self action:@selector(BuyClicked:) forControlEvents:UIControlEventTouchUpInside];
    [info addTarget:self action:@selector(InviteClicked:) forControlEvents:UIControlEventTouchUpInside];
	NSString *str1=[NSString stringWithFormat:@"%@",[[PlantsArray objectAtIndex:indexPath.row] valueForKey:@"Plant_Name"]];
	NSString *planting_str=[NSString stringWithFormat:@"%@",[[PlantsArray objectAtIndex:indexPath.row]valueForKey:@"Planting"]];
	NSString *flowering_str=[NSString stringWithFormat:@"%@",[[PlantsArray objectAtIndex:indexPath.row]valueForKey:@"Flowering"]];
	NSString *hardiness_str=[NSString stringWithFormat:@"%@",[[PlantsArray objectAtIndex:indexPath.row] valueForKey:@"Hardiness"]];
	NSString *soil_str=[NSString stringWithFormat:@"%@",[[PlantsArray objectAtIndex:indexPath.row] valueForKey:@"Soil_Type"]];		
	NSString *url_string=[NSString stringWithFormat:@"%@",[[PlantsArray objectAtIndex:indexPath.row] valueForKey:@"Main_Image_Url"]];
	
	NSURL *url=[[NSURL alloc]initWithString:url_string];
	//imageView.imageURL = url;
	[imageView setImageURL:url];
	[cell.contentView addSubview:imageView];
	hardiness.text=hardiness_str;
	soil.text=soil_str;
	plant_name.text=str1;
	planting.text=planting_str;	
	flowering.text=flowering_str;
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(invitationInfoObj){
		invitationInfoObj =nil;
		[invitationInfoObj release];
	}

    appdelObj.plantIDStr =[NSString stringWithFormat:@"%d",[[[PlantsArray objectAtIndex:indexPath.row] valueForKey:@"Plant_Id"]intValue]];
    invitationInfoObj = [[InvitationInfo alloc] initWithNibName:@"InvitationInfo" bundle:nil];
    [self.navigationController pushViewController:invitationInfoObj animated:YES];

}

- (void)viewDidUnload
{
    [nursaryNameLbl release];
    nursaryNameLbl = nil;
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
