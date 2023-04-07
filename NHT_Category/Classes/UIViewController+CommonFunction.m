//
//  UIViewController+CommonFunction.m
//  TestAAAA
//
//  Created by NHT on 2023/3/30.
//

#import "UIViewController+CommonFunction.h"

@implementation UIViewController (CommonFunction)

#pragma mark  键盘隐藏事件
- (void)dismissKeyboard{
    [self.view endEditing:YES];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self dismissKeyboard];
}
-(UIImage *)createImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
#pragma mark---设置设置导航条标题、背景颜色、导航条左侧或右侧按钮(文字、图片类型)
#pragma mark---设置设置导航条标题、背景颜色、导航条左侧或右侧按钮(文字、图片类型)
///设置导航条标题内容、颜色、字体
-(void)setNavTitle:(NSString *)navTitle textColor:(UIColor*)textColor textFont:(UIFont *)textFont{
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = YES;
    UILabel *titleLabel_Mine = [[UILabel alloc] init];
    titleLabel_Mine.font = textFont;
    titleLabel_Mine.textAlignment = NSTextAlignmentCenter;
    titleLabel_Mine.textColor = textColor;
    titleLabel_Mine.text = navTitle;
    titleLabel_Mine.lineBreakMode = NSLineBreakByTruncatingMiddle;
    titleLabel_Mine.backgroundColor = UIColor.clearColor;
    self.navigationItem.titleView = titleLabel_Mine;
    [self setNavBarBackColor:UIColor.whiteColor];
}

-(void)setNavBarBackColor:(UIColor *)imageColor{
    ///设置导航条背景颜色,不传默认是白色，可传渐变色
    if (!imageColor) {
        imageColor = UIColor.whiteColor;
    }
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *navigationBarAppearance = [UINavigationBarAppearance new];
        
        [navigationBarAppearance setBackgroundImage:[self createImageWithColor:imageColor]];
        [navigationBarAppearance setShadowImage:[self createImageWithColor:imageColor]];
        
        navigationBarAppearance.backgroundColor = UIColor.clearColor;
        navigationBarAppearance.shadowColor = UIColor.clearColor;
        
        navigationBarAppearance.backgroundEffect = nil;
        self.navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance;
        self.navigationController.navigationBar.standardAppearance = navigationBarAppearance;
    }else{
        UIImage *backgroundImage = [self createImageWithColor:imageColor];
        [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [self createImageWithColor:UIColor.clearColor]; //去掉黑线
    }
}
///设置导航条左侧、右侧按钮，可以设置文字类型和图片类型按钮，文字和图片都传优先设置图片
-(UIBarButtonItem *)setNavItemTitle:(NSString *)title image:(UIImage *)image isRightBarButton:(BOOL)isRightBarButton textColor:(UIColor *)textColor textFont:(UIFont *)textFont{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 44, 44)];
    button.backgroundColor = [UIColor clearColor];
    if (image) {
        button.imageView.contentMode = isRightBarButton ? UIViewContentModeRight : UIViewContentModeLeft;
        CGFloat rightFloat = isRightBarButton ? -24:24;
        [button setImage:image forState:UIControlStateNormal];
        if (@available(iOS 15.0, *)) {
            UIButtonConfiguration *buttonConfig = [UIButtonConfiguration plainButtonConfiguration];
            buttonConfig.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, rightFloat);
            button.configuration = buttonConfig;
        }else{
            [button setImageEdgeInsets:UIEdgeInsetsMake(0,0,0, rightFloat)];//(上,左,下,右) 右侧按钮
        }
    }else if (title && title.length > 0) {
        button.titleLabel.font = textFont;
        [button setTitle:title forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        if(isRightBarButton){
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        }
        if(textColor){
            [button setTitleColor:textColor forState:UIControlStateNormal];
        }else{
            [button setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        }
    }
    
    if (isRightBarButton) {
        [button addTarget:self action:@selector(rightBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [button addTarget:self action:@selector(leftBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    if(isRightBarButton){
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }else{
        self.navigationItem.leftBarButtonItem = barButtonItem;
    }
    return barButtonItem;
}
/**  返回键按钮点击事件  */
-(void)leftBarButtonClick{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
///导航条右侧按钮点击效果
-(void)rightBarButtonClick{
    
}

#pragma mark---创建各种类型提示窗AlertViewController
#pragma mark---创建各种类型提示窗AlertViewController
/// 创建alert---自定义取消、确认按钮文字，取消按钮文字不存在就不添加取消按钮然后就变成只有一个按钮的alert
- (UIAlertController *)alert_SureAndCancel_Message:(NSString *)message sureText:(NSString *)sureText cancelText:(NSString *)cancelText withTag:(int)tag{
    UIAlertController *alert = [self createAlertWithTitle:@"" message:message];
    [self addSureActionFromAlert:alert isInput:NO sureText:sureText withTag:(int)tag];
    if(cancelText && cancelText.length > 0){
        [self addCancelActionFromAlert:alert cancelText:cancelText];
    }
    [self presentViewController:alert animated:YES completion:nil];
    return alert;
}
/// 创建alert---带有默认的确定、取消按钮
- (UIAlertController *)alert_DefaultSureAndCancel_Message:(NSString *)message withTag:(int)tag{
    NSString * defaultCancelText = [[NSUserDefaults standardUserDefaults] objectForKey:@"DefaultCancelText"];
    if (defaultCancelText == nil || defaultCancelText == NULL || [defaultCancelText isKindOfClass:[NSNull class]] || [[defaultCancelText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0){
        defaultCancelText = @"取消";
    }
    return [self alert_SureAndCancel_Message:message sureText:@"" cancelText:defaultCancelText withTag:tag];
}
/// 创建alert---只有一个按钮，可自定义按钮文字
- (UIAlertController *)alert_Sure_Message:(NSString *)message sureText:(NSString *)sureText withTag:(int)tag{
    UIAlertController *alert = [self createAlertWithTitle:@"" message:message];
    [self addSureActionFromAlert:alert isInput:NO sureText:sureText withTag:(int)tag];
    [self presentViewController:alert animated:YES completion:nil];
    return alert;
}
/// 创建alert---输入框类型的alert，可通过alert.textFields.firstObject获取内容
- (UIAlertController *)alert_Input_Message:(NSString *)message withTag:(int)tag{
    UIAlertController *alert = [self createAlertWithTitle:@"" message:message];
    ///给alert添加输入框
    [alert addTextFieldWithConfigurationHandler:^(UITextField*_Nonnull textField) {
        [self configAlertTextField:textField];
    }];
    [self addSureActionFromAlert:alert isInput:YES sureText:@"" withTag:(int)tag];
    [self addCancelActionFromAlert:alert cancelText:@""];
    [self presentViewController:alert animated:YES completion:nil];
    return alert;
}
/// 创建alert---自动消失的alert，disappearTime自动消失时间，不能为0
- (UIAlertController *)alert_Disappear_Message:(NSString *)message disappearTime:(CGFloat)disappearTime withTag:(int)tag{
    if (!message || message.length < 1) {
        NSString * defaultMessageTest = [[NSUserDefaults standardUserDefaults] objectForKey:@"DefaultMessageText"];
        if (defaultMessageTest == nil || defaultMessageTest == NULL || [defaultMessageTest isKindOfClass:[NSNull class]] || [[defaultMessageTest stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0){
            message = @"操作失败，请重试！";
        }else{
            message = defaultMessageTest;
        }
    }
    UIAlertController *alert = [self createAlertWithTitle:@"" message:message];
    if (disappearTime == 0) {
        disappearTime = 0.5;
        NSLog(@"\n\n\ndisappearTime不能为0\n\n\n");
    }
    [self presentViewController:alert animated:YES completion:nil];
    [self performSelector:@selector(alertDisappear:) withObject:@[alert,@(tag)] afterDelay:disappearTime];
    return alert;
}

///创建alertViewController
- (UIAlertController *)createAlertWithTitle:(NSString *)title message:(NSString *)message{
    UIAlertController *alert = [UIAlertController  alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    return alert;
}
///给alert添加确定按钮
- (void)addSureActionFromAlert:(UIAlertController *)alert isInput:(BOOL)isInput sureText:(NSString *)sureText withTag:(int)tag{
    if (!sureText || sureText.length < 1) {
        NSString * defaultSureText = [[NSUserDefaults standardUserDefaults] objectForKey:@"DefaultSureText"];
        if (defaultSureText == nil || defaultSureText == NULL || [defaultSureText isKindOfClass:[NSNull class]] || [[defaultSureText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0){
            sureText = @"确定";
        }else{
            sureText = defaultSureText;
        }
    }
    [alert addAction:[UIAlertAction actionWithTitle:sureText style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self alertClickSureActionWithTag:tag];
    }]];
}
///给alert添加取消按钮
- (void)addCancelActionFromAlert:(UIAlertController *)alert cancelText:(NSString *)cancelText{
    if (!cancelText || cancelText.length < 1) {
        NSString * defaultCancelText = [[NSUserDefaults standardUserDefaults] objectForKey:@"DefaultCancelText"];
        if (defaultCancelText == nil || defaultCancelText == NULL || [defaultCancelText isKindOfClass:[NSNull class]] || [[defaultCancelText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0){
            cancelText = @"取消";
        }else{
            cancelText = defaultCancelText;
        }
    }
    [alert addAction:[UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleCancel handler:nil]];
}
///通过重写此方法，配置输入框类型的alert种输入框的信息
- (void)configAlertTextField:(UITextField *)textField{
    
}
///alert自动消失调用的方法
-(void)alertDisappear:(NSArray *)object{
    UIAlertController *alert = object[0];
    int tag = [object[1] intValue];
    [alert dismissViewControllerAnimated:YES completion:^{
        [self alertClickSureActionWithTag:tag];
    }];
}
///点击alert的确认按钮 如有需要，该方法内容可以进行改写
- (void)alertClickSureActionWithTag:(int)tag{
    NSLog(@"点击确认");
}
#pragma mark---暂无数据效果


@end
