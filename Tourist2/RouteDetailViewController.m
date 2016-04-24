//
//  RouteDetailViewController.m
//  Tourist2
//
//  Created by 刘硕晋 on 16/4/24.
//  Copyright © 2016年 ginkee. All rights reserved.
//

#import "RouteDetailViewController.h"
#import "RouteRatingTableViewController.h"

@interface RouteDetailViewController ()

//@property (strong, nonatomic) IBOutlet UIView *test;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *intro;

//@property (weak, nonatomic) IBOutlet UILabel *trans;

@property (weak, nonatomic) IBOutlet UISwitch *isFavorite;
@property (weak, nonatomic) IBOutlet UILabel *favoMsg;

@property (weak, nonatomic) IBOutlet UISlider *score;
@property (weak, nonatomic) IBOutlet UITextView *comment;
@end

@implementation RouteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.name.text = self.name1;
    self.intro.text = self.intro1;
    //self.trans.text = self.trans1;
    NSLog(@"user:%@, id:%@", self.userName, self.routeId);
    
    [self isFav];
}


- (void)isFav{
    NSURL* url = [NSURL URLWithString:@"http://192.168.137.1:8080/Tourist/routeFavorite.spring"];
    NSString* name = self.name.text;
    //NSString* password = self.password.text;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString* bodyStr = [NSString stringWithFormat:@"username=%@&routeid=%@", self.userName, self.routeId];
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"%@", data);
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //self.Test.text = str;
        //self.loginText.text = [NSString stringWithFormat:@"result:%@",str];
        NSLog(@"result:%@",str);
        if ([str isEqualToString:@"yes"]) {
            [self.isFavorite setOn:YES];
            self.favoMsg.text = @"您已收藏该路线";
        } else {
            [self.isFavorite setOn:NO];
            self.favoMsg.text = @"收藏该路线";
        }
    }];
}

- (IBAction)favo:(id)sender {
    //favorite
    if ([self.isFavorite isOn]) {
        [self favo];
    } else {  //cancel Favorite
        [self noFavo];
    }
}

- (void) favo{
    NSURL* url = [NSURL URLWithString:@"http://192.168.137.1:8080/Tourist/routeFavo.spring"];
    NSString* name = self.name.text;
    //NSString* password = self.password.text;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString* bodyStr = [NSString stringWithFormat:@"username=%@&routeid=%@", self.userName, self.routeId];
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"%@", data);
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"result:%@",str);
        if ([str isEqualToString:@"yes"]) {
            self.favoMsg.text = @"收藏成功";
            [self.isFavorite setOn:YES];
        } else {
            //[self.isFavorite setOn:NO];
            self.favoMsg.text = @"收藏失败";
        }
    }];
}

- (void) noFavo{
    NSURL* url = [NSURL URLWithString:@"http://192.168.137.1:8080/Tourist/routeNoFavo.spring"];
    NSString* name = self.name.text;
    //NSString* password = self.password.text;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString* bodyStr = [NSString stringWithFormat:@"username=%@&routeid=%@", self.userName, self.routeId];
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"%@", data);
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"result:%@",str);
        if ([str isEqualToString:@"yes"]) {
            self.favoMsg.text = @"取消收藏成功";
            [self.isFavorite setOn:NO];
        } else {
            //[self.isFavorite setOn:NO];
            self.favoMsg.text = @"取消收藏失败";
        }
    }];
    
}
- (IBAction)rate:(id)sender {
    
    NSURL* url = [NSURL URLWithString:@"http://192.168.137.1:8080/Tourist/addRouteRating.spring"];
    NSString* name = self.name.text;
    //NSString* password = self.password.text;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString* bodyStr = [NSString stringWithFormat:@"username=%@&routeid=%@&score=%f&comment=%@", self.userName, self.routeId, self.score.value, self.comment.text];
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //NSLog(@"%@", data);
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"result:%@",str);
        if ([str isEqualToString:@"yes"]) {
            //self.favoMsg.text = @"取消收藏成功";
            self.comment.text = @"评论成功";
        } else {
            //self.favoMsg.text = @"取消收藏失败";
            self.comment.text = @"评论失败，您已被禁言";
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)getRouteRating:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RouteRatingTableViewController* sr = [storyboard instantiateViewControllerWithIdentifier:@"routeRatingTableViewController"];
    /*NSDictionary* dict = [self.spotArray objectAtIndex:indexPath.row];
     
     //cell.textLabel.text = [dict valueForKey:@"name"];
     //spotDetail
     //NSLog(@"%@", spotDetail);
     NSLog(@"%@", [dict valueForKey:@"intro"]);
     [spotDetail setIntro1:[dict valueForKey:@"intro"]];
     [spotDetail setName1:[dict valueForKey:@"name"]];
     [spotDetail setTrans1:[dict valueForKey:@"trans"]];
     [spotDetail setSpotId:[dict valueForKey:@"id"]];
     SpotViewController *vc = self.navigationController;
     //NSLog(@"na->:%@", vc.nameText);
     [spotDetail setUserName:vc.nameText];*/
    [sr setRouteId:self.routeId];
    [self.navigationController pushViewController:sr animated:YES];
}
@end
