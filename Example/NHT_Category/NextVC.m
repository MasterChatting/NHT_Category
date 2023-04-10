//
//  NextVC.m
//  NHT_Category_Example
//
//  Created by NHT on 2023/4/10.
//  Copyright © 2023 NHT18610866107@163.com. All rights reserved.
//

#import "NextVC.h"
#import "UIViewController+CommonFunction.h"

@interface NextVC ()

@end

@implementation NextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavTitle:@"akdhska"];
    [self setNavItem_rightTitle:@"rightiem"];
    [self setNavBarBackColor:UIColor.yellowColor];
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
