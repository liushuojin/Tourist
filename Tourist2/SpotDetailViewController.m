//
//  SpotDetailViewController.m
//  Tourist2
//
//  Created by 刘硕晋 on 16/4/18.
//  Copyright © 2016年 ginkee. All rights reserved.
//

#import "SpotDetailViewController.h"

@interface SpotDetailViewController ()
@property (strong, nonatomic) IBOutlet UIView *test;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *intro;

@property (weak, nonatomic) IBOutlet UILabel *trans;

@property (weak, nonatomic) IBOutlet UISwitch *isFavorite;


@end

@implementation SpotDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSLog(@"dal");
    //NSLog(@"%@", self.name.text);
    self.name.text = self.name1;
    self.intro.text = self.intro1;
    self.trans.text = self.trans1;
    NSLog(@"user:%@, id:%@", self.userName, self.spotId);
    
    [self isFav];
    
    
}

- (void)isFav{
    
    NSURL* url = [NSURL URLWithString:@"http://192.168.137.1:8080/Tourist/spotFavorite.spring"];
    NSString* name = self.name.text;
    //NSString* password = self.password.text;
    
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    NSString* bodyStr = [NSString stringWithFormat:@"username=%@&spotid=%@", self.userName, self.spotId];
    
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSLog(@"%@", data);
        
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        //self.Test.text = str;
        
        //self.loginText.text = [NSString stringWithFormat:@"result:%@",str];
        
        NSLog(@"result:%@",str);
        
        if ([str isEqualToString:@"yes"]) {
            
            
            [self.isFavorite setOn:YES];
            
            
        } else {
            
            [self.isFavorite setOn:NO];
        
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

@end
