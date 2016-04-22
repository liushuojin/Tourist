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
    NSLog(@"user:%@", self.userName);
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
