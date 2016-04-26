//
//  InvitationInfo.m
//  Find Me That Plant
//
//  Created by APPLE apple on 12/7/11.
//  Copyright (c) 2011 openxcel. All rights reserved.
//

#import "InvitationInfo.h"
#import "EnlargeImageView.h"
@implementation InvitationInfo

@synthesize scrollVw,urlImageData;
@synthesize labelPlantName;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
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
-(void)viewWillDisappear:(BOOL)animated{
    self.title = @"Back";
}

- (void)viewDidLoad{

    
    [super viewDidLoad];
    self.title = @"Information";
	appObj=(Find_Me_That_PlantAppDelegate *)[[UIApplication sharedApplication]delegate];
    
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 100,100)];
	titleLabel.font = [UIFont boldSystemFontOfSize: 18.0f];
	titleLabel.textAlignment = UITextAlignmentCenter;
	titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.textColor = [UIColor blackColor];
	titleLabel.text = @"Information";
	self.navigationItem.titleView=titleLabel;
       
    [self getplant_detail];
    
    
}

-(void)getplant_detail{
   
    [AlertHandler showAlertForProcess];
    Find_Me_That_PlantAppDelegate *appdel =[[UIApplication sharedApplication]delegate];
    NSString *urlGetDetl = [NSString stringWithFormat:@"http://findmethatplant.com/nurseries/web_services/plant_profile.php?Plant_Id=%@",appdel.plantIDStr];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlGetDetl]];
    JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(searchResult:) andHandler:self]; 
    NSLog(@"%@",parser);
    
}

-(void)searchResult :(NSDictionary *)dictinary{

   // NSLog(@"%@",dictinary);
    
    labelPlantName.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Plant_Name"] objectAtIndex:0]retain]] ;
    labelColour.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Colours"]objectAtIndex:0]retain]];
    labelPuring.text=[NSString stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Pruning"]objectAtIndex:0]retain]];
    labelPerennial.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Perennial"]objectAtIndex:0]retain]];
    labelHeight.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Height"]objectAtIndex:0]retain]];
    labelHardiness.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Pruning"]objectAtIndex:0]retain]];
    labelSoilType.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Soil_Type"]objectAtIndex:0]retain]];
    labelCollection.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Collection"]objectAtIndex:0]retain]];
    labelPrice.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Price"]objectAtIndex:0]retain]];
    labelSizeForThisPrice.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Size_For_This_Price"]objectAtIndex:0]retain]];
    labelAvailableInVariousSize.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Available_In_More_Than_One_Size"]objectAtIndex:0]retain]];
    labelShippingEst.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Shipping_Est"]objectAtIndex:0]retain]];
    labelDeliveryTime.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Delivery_Time"]objectAtIndex:0]retain]];
    labelDescription.text=[NSString  stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Description"]objectAtIndex:0]retain]];       
   // tielsImage4.imageURL =[NSURL URLWithString:[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Image4_Url"]objectAtIndex:0]retain]];
    tielsImage1.imageURL =[NSURL URLWithString:[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Main_Image_Url"]objectAtIndex:0]retain]];
    urlImageData = [[NSURL alloc]initWithString:[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Main_Image_Url"]objectAtIndex:0]retain]];
    //tielsImage2.imageURL =[NSURL URLWithString:[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Image2_Url"]objectAtIndex:0]retain]];
    //tielsImage3.imageURL =[NSURL URLWithString:[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Image3_Url"]objectAtIndex:0] retain] ];
    urlPlantStr = [NSString stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"Plant_Url"] objectAtIndex:0] retain] ];
    appObj.strurl=urlPlantStr;
    
    appObj.userId  = [NSString stringWithFormat:@"%@",[[[[dictinary valueForKey:@"Plants"]valueForKey:@"User_Id"] objectAtIndex:0] retain] ];
    [AlertHandler hideAlert];

    
}

-(IBAction)urlClicked:(id)sender
{
   
     
    NSMutableArray *vcArray = [NSMutableArray arrayWithArray:[self.navigationController viewControllers]];
    NSLog(@"%@",vcArray);
    //NurseryView *obj_nursery = [[NurseryView alloc]init];
    
    if ([vcArray count]==6) {
        [self.navigationController popToViewController:[vcArray objectAtIndex:4] animated:YES];
    }else
        
        if ([vcArray count]<3 || [vcArray count]>4) {
            [self.navigationController popToViewController:[vcArray objectAtIndex:3] animated:YES];
        }else {
             NurseryView *obj_nursery = [[NurseryView alloc]init];
            [self.navigationController pushViewController:obj_nursery animated:YES];
        }
    
    
          // NurseryView *obj_nursery = [[NurseryView alloc]init];
        //[self.navigationController pushViewController:obj_nursery animated:YES];
	
}


-(IBAction)BuyClicked:(id)sender
{
	
    websiteview *obj_web = [[websiteview alloc]initWithNibName:@"websiteview" bundle:nil];
    [obj_web set_url:appObj.strurl];
	[self presentModalViewController:obj_web animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"Information";

    scrollVw.frame = CGRectMake(0, 0, 320, 290);
    scrollVw.contentSize = CGSizeMake(320, 640);

	UIImage *buyImage = [UIImage imageNamed:@"right.png"];
	[nurbutton setBackgroundImage:buyImage forState:UIControlStateNormal];
	
	UIImage *infoImage = [UIImage imageNamed:@"left.png"];
	
	[buybutton setBackgroundImage:infoImage forState:UIControlStateNormal];
	[nur1button setBackgroundImage:buyImage forState:UIControlStateNormal];
	[buy1button setBackgroundImage:infoImage forState:UIControlStateNormal];
    

	//detail_scroll.frame = CGRectMake(0, 10, 320, 108);
	
}

-(IBAction)enlargeImage:(id)sender{

    EnlargeImageView *objEnlarge=[[EnlargeImageView alloc]init ];
    [objEnlarge setUrlImage:urlImageData];
     [self.navigationController pushViewController:objEnlarge animated:YES];

}

- (void)viewDidUnload
{
    appObj.strurl =nil;

    [labelPlantName release];
    labelPlantName = nil;
    [labelColour release];
    labelColour = nil;
    [labelPuring release];
    labelPuring = nil;
    [labelHeight release];
    labelHeight = nil;
    [labelHardiness release];
    labelHardiness = nil;
    [labelPerennial release];
    labelPerennial = nil;
    [labelSoilType release];
    labelSoilType = nil;
    [labelCollection release];
    labelCollection = nil;
    [labelPrice release];
    labelPrice = nil;
    [labelSizeForThisPrice release];
    labelSizeForThisPrice = nil;
    [labelAvailableInVariousSize release];
    labelAvailableInVariousSize = nil;
    [labelShippingEst release];
    labelShippingEst = nil;
    [labelDeliveryTime release];
    labelDeliveryTime = nil;
    [labelSizeForThisPrice release];
    labelSizeForThisPrice = nil;
    [tielsImage4 release];
    tielsImage4 = nil;
    [tielsImage1 release];
    tielsImage1 = nil;
    [tielsImage2 release];
    tielsImage2 = nil;
    [tielsImage3 release];
    tielsImage3 = nil;
    [labelDescription release];
    labelDescription = nil;
    [enlargeImgBtn release];
    enlargeImgBtn = nil;
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
    [labelPlantName release];
    [labelColour release];
    [labelPuring release];
    [labelHeight release];
    [labelHardiness release];
    [labelPerennial release];
    [labelSoilType release];
    [labelCollection release];
    [labelPrice release];
    [labelSizeForThisPrice release];
    [labelAvailableInVariousSize release];
    [labelShippingEst release];
    [labelDeliveryTime release];
    [labelSizeForThisPrice release];
    [tielsImage4 release];
    [tielsImage1 release];
    [tielsImage2 release];
    [tielsImage3 release];
    [labelDescription release];
    [urlPlantStr release];
    [enlargeImgBtn release];
    [super dealloc];
}
@end
