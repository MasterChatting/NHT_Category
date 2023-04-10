//
//  DefaultConfiguration.h
//  NHT_Category
//
//  Created by NHT on 2023/4/10.
//

#import <Foundation/Foundation.h>


@interface DefaultConfiguration : NSObject

+(DefaultConfiguration *)shareDefaultConfiguration;
//默认文字颜色defaultNavTitleColor
//默认文字大小defaultNavTitleFont
//
//按钮
//默认左侧返回按钮图片 defaultLeftItemImage
//默认按钮文字颜色颜色 defaultItemColor
//默认按钮文字大小 defaultItemFont

#pragma mark---导航条 标题默认配置
///默认文字颜色
@property (nonatomic,strong) UIColor  *defaultNavTitleColor;
////默认文字大小
@property (nonatomic,strong) UIFont  *defaultNavTitleFont;

#pragma mark---导航条 按钮的默认配置
///默认左侧返回按钮图片
@property (nonatomic,strong) UIImage  *defaultLeftItemImage;
///默认按钮文字颜色颜色
@property (nonatomic,strong) UIColor  *defaultItemColor;
///默认按钮文字大小
@property (nonatomic,strong) UIFont  *defaultItemFont;


#pragma mark---alert默认信息
//defaultMessageText（默认提示语文字）
//defaultSureText（默认确认文字）
//defaultCancelText（默认取消文字）
///默认提示语文字
@property (nonatomic,strong) NSString  *defaultMessageText;
///默认确认文字
@property (nonatomic,strong) NSString  *defaultSureText;
///默认取消文字
@property (nonatomic,strong) NSString  *defaultCancelText;

@end


