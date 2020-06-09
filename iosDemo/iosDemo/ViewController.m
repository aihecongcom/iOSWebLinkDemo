//
//  ViewController.m
//  HecongDemo
//
//  Created by 合从 on 2020/6/8.
//  Copyright © 2020 合从. All rights reserved.
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#import "ViewController.h"
#import "WebLinkViewController.h"
@interface ViewController ()
@property (strong, nonatomic) UIButton * Nbtn;
@property (strong, nonatomic) UIButton * Ybtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    self.title = @"示例";
    
    UIImageView * logoimage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2 -30, 200, 60, 60)];
    logoimage.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:logoimage];
    
    self.Nbtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.Nbtn.frame = CGRectMake(kScreenWidth/2 - 150, 350, 300, 50);
    self.Nbtn.backgroundColor = [UIColor colorWithRed:33/255.0 green:150/255.0 blue:243/255.0 alpha:1];
    self.Nbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    self.Nbtn.tag = 101;
    [self.Nbtn setTitle:@"对话链接接入示例一" forState:UIControlStateNormal];
    [self.Nbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.Nbtn addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.Nbtn];
    
    self.Ybtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.Ybtn.frame = CGRectMake(kScreenWidth/2 - 150, 430, 300, 50);
    self.Ybtn.backgroundColor = [UIColor colorWithRed:33/255.0 green:150/255.0 blue:243/255.0 alpha:1];
    [self.Ybtn setTitle:@"对话链接接入示例二" forState:UIControlStateNormal];
     [self.Ybtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     self.Ybtn.tag = 102;
     [self.Ybtn addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.Ybtn];
    
}
-(void)butClick:(UIButton *)sender{
    BOOL ishidden;
    if (sender.tag == 101) {
        ishidden = YES;
    }else{
        ishidden = NO;
    }
    WebLinkViewController * wbVC = [[WebLinkViewController alloc]init];
    wbVC.ishead = ishidden;
    [self.navigationController pushViewController:wbVC animated:YES];
    
}



@end
