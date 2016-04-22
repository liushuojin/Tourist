//
//  TouristTabBarController.m
//  Tourist2
//
//  Created by 刘硕晋 on 16/4/22.
//  Copyright © 2016年 ginkee. All rights reserved.
//

#import "TouristTabBarController.h"

@interface TouristTabBarController ()

@end

@implementation TouristTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"name: %@", self.nameText);
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
