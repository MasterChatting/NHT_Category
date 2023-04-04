//
//  UIViewController+CommonFunction.h
//  TestAAAA
//
//  Created by NHT on 2023/3/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (CommonFunction)

#pragma mark---设置设置导航条标题、背景
/**
 设置导航条标题内容、颜色、字体，会自动设置导航条背景色为白色（可调用setNavBarBackColor重置）
 @param navTitle 文字
 @param textColor 颜色
 @param textFont 字体
 */
-(void)setNavTitle:(NSString *)navTitle textColor:(UIColor*)textColor textFont:(UIFont *)textFont;
/**
 设置导航条背景颜色,不传默认是白色，可传渐变色
 @param imageColor 背景颜色
 */
-(void)setNavBarBackColor:(UIColor *)imageColor;
/// 设置导航条左侧、右侧按钮，可以设置文字类型和图片类型按钮，文字和图片都传优先设置图片
/// @param title 按钮文字
/// @param image 按钮图片
/// @param isRightBarButton 是否是右侧按钮
/// @param textColor 文字颜色
/// @param textFont 文字字体
-(UIBarButtonItem *)setNavItemTitle:(NSString *)title image:(UIImage *)image isRightBarButton:(BOOL)isRightBarButton textColor:(UIColor *)textColor textFont:(UIFont *)textFont;

#pragma mark---创建各种类型提示窗AlertViewController
#pragma mark---创建各种类型提示窗AlertViewController
/**如果想设置alert的title，可以直接设置
 UIAlertController *alert = [self createDisappearALertWithMessage:@"message" disappearTime:3 withTag:10];
 alert.title = @"需要的titile";
 */

/// 创建alert---自定义取消、确认按钮文字，取消按钮文字不存在就不添加取消按钮然后就变成只有一个按钮的alert
/// - Parameters:
///   - message: 提示语
///   - sureText: 确认按钮文字
///   - cancleText: 取消按钮文字
///   - tag: 唯一标识值
- (void)createChooseALertWithMessage:(NSString *)message sureText:(NSString *)sureText cancleText:(NSString *)cancleText withTag:(int)tag;

/// 创建alert---输入框类型的alert，可通过alert.textFields.firstObject获取内容
/// - Parameters:
///   - message: 提示语
///   - tag: 唯一标识值
- (UIAlertController *)createInputAlertWithMessage:(NSString *)message withTag:(int)tag;

//////通过重写此方法，配置输入框类型的alert种输入框的信息
- (void)configAlertTextField:(UITextField *)textField;

/// 创建alert---自动消失的alert，disappearTime自动消失时间，不能为0
/// - Parameters:
///   - message: 提示语
///   - disappearTime: disappearTime自动消失时间，不能为0
///   - tag: 唯一标识值
- (UIAlertController *)createDisappearALertWithMessage:(NSString *)message disappearTime:(CGFloat)disappearTime withTag:(int)tag;

///提示框点击确认或者自动消失后的回调方法，该方法内容可以进行改写
- (void)alertClickSureActionWithTag:(int)tag;

@end

NS_ASSUME_NONNULL_END