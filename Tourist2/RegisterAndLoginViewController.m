//
//  RegisterAndLoginViewController.m
//  Tourist2
//
//  Created by 刘硕晋 on 16/4/21.
//  Copyright © 2016年 ginkee. All rights reserved.
//

#import "RegisterAndLoginViewController.h"

@interface RegisterAndLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UILabel *msg;

@end

@implementation RegisterAndLoginViewController
- (IBAction)register:(id)sender {
    NSURL* url = [NSURL URLWithString:@"http://192.168.137.1:8080/Tourist/register.spring"];
    NSString* name = self.name.text;
    NSString* password = self.password.text;
    
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    NSString* bodyStr = [NSString stringWithFormat:@"name=%@&password=%@", name, password];
    
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSLog(@"%@", data);
        
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        //self.Test.text = str;
        
        //self.loginText.text = [NSString stringWithFormat:@"result:%@",str];
        
        NSLog(@"result:%@",str);
        
        if ([str isEqualToString:@"yes"]) {
            
            
            //[self performSegueWithIdentifier:@"toMain" sender:self];
            self.msg.text = @"注册成功，你现在可以登陆了！";
            
        } else {
            
            self.msg.text = @"注册失败";
            
        }
        
    }];

}
- (IBAction)login:(id)sender {
    //[self performSegueWithIdentifier:@"toMain" sender:self];
    
    NSURL* url = [NSURL URLWithString:@"http://192.168.137.1:8080/Tourist/clientLogin.spring"];
    NSString* name = self.name.text;
    NSString* password = self.password.text;
    
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    NSString* bodyStr = [NSString stringWithFormat:@"name=%@&password=%@", name, password];
    
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSLog(@"%@", data);
        
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        //self.Test.text = str;
        
        //self.loginText.text = [NSString stringWithFormat:@"result:%@",str];
        
        NSLog(@"result:%@",str);
        
        if ([str isEqualToString:@"yes"]) {
            
            
            [self performSegueWithIdentifier:@"toMain" sender:self];
            
            
        } else {
            
            self.msg.text = @"登录失败";
            
        }
        
    }];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"俺来啦");
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
