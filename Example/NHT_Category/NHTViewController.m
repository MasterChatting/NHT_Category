//
//  NHTViewController.m
//  NHT_Category
//
//  Created by NHT18610866107@163.com on 04/04/2023.
//  Copyright (c) 2023 NHT18610866107@163.com. All rights reserved.
//

#import "NHTViewController.h"
#import "UIViewController+CommonFunction.h"
#import "NextVC.h"
#import "DefaultConfiguration.h"

@interface NHTViewController ()

@end

@implementation NHTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self setNavTitle:@"9090" textColor:UIColor.redColor textFont:[UIFont systemFontOfSize:20]];

   
    [self setNavTitle:@"akdhska"];
    [self setNavItem_rightTitle:@"rightiem"];
    [self setNavBarBackColor:UIColor.whiteColor];
}
-(void)viewDidAppear:(BOOL)animated{
//    [self alert_Sure_Message:@"12323"];
    [self alert_DefaultSureAndCancel_Message:@"1343" withTag:2];
}
-(void)alertClickSureActionWithTag:(int)tag{
    [DefaultConfiguration shareDefaultConfiguration].defaultControllerBackColor = UIColor.redColor;
    NextVC *vc = [[NextVC alloc] init];
    UINavigationController *rootVc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:rootVc animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
