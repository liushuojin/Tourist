//
//  RouteTableViewController.m
//  Tourist2
//
//  Created by 刘硕晋 on 16/4/24.
//  Copyright © 2016年 ginkee. All rights reserved.
//

#import "RouteTableViewController.h"
#import "RouteDetailViewController.h"
#import "RouteViewController.h"

@interface RouteTableViewController ()

@end

@implementation RouteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)getRoutesData{
    NSURL* url = [NSURL URLWithString:@"http://192.168.137.1:8080/Tourist/appGetRoutes.spring"];
    
    
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"GET";
    
    
    
    
    /*[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
     
     //NSLog(@"%@", data);
     //self.data =
     NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
     NSLog(@"%@", str);
     self.data = str;
     NSLog(@"你妹:%@", self.data);
     
     }];*/
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str1 = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str1);
    self.data = str1;
    //NSDictionary* spotDic = [NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingMutableLeaves error:nil];
    //NSLog(@"spot:%@", spotDic);
    //Spot *s = [Spot spotWithDict:spotDic];
    //NSLog(@"%@", s);
    self.routeArray = [[NSArray alloc] initWithArray:[NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingMutableContainers error:nil]];
    NSLog(@"spots:%@", self.routeArray);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    [self getRoutesData];
    
    return [self.routeArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;*/
    
    
    static NSString* CellIdentifier = @"RouteCell";
    UITableViewCell *cell ;//= [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    //[[cell textLabel] setText:self.data];
    //NSLog(@"data:%@", self.data);
    // Configure the cell...
    NSDictionary* dict = [self.routeArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict valueForKey:@"name"];
    cell.detailTextLabel.text = [dict valueForKey:@"intro"];
    
    return cell;
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
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RouteDetailViewController* routeDetail = [storyboard instantiateViewControllerWithIdentifier:@"routeDetail"];
    NSDictionary* dict = [self.routeArray objectAtIndex:indexPath.row];
    
    NSLog(@"%@", [dict valueForKey:@"intro"]);
    [routeDetail setIntro1:[dict valueForKey:@"intro"]];
    [routeDetail setName1:[dict valueForKey:@"name"]];
    //[spotDetail setTrans1:[dict valueForKey:@"trans"]];
    [routeDetail setRouteId:[dict valueForKey:@"id"]];
    RouteViewController *vc = self.navigationController;
    //NSLog(@"na->:%@", vc.nameText);
    [routeDetail setUserName:vc.nameText];
    [self.navigationController pushViewController:routeDetail animated:YES];
}

@end
