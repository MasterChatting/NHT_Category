//
//  DefaultConfiguration.m
//  NHT_Category
//
//  Created by NHT on 2023/4/10.
//

#import "DefaultConfiguration.h"

@implementation DefaultConfiguration

#pragma mark---创建单利对象
+(instancetype)shareDefaultConfiguration{
    static DefaultConfiguration *shareDefaultConfiguration = nil;
    static dispatch_once_t onceTokern;
    dispatch_once(&onceTokern, ^{
        shareDefaultConfiguration = [[super allocWithZone:NULL] init];
        //导航条 标题默认配置
        shareDefaultConfiguration.defaultNavTitleColor = UIColor.blackColor;
        shareDefaultConfiguration.defaultNavTitleFont = [UIFont boldSystemFontOfSize:16];
        //导航条 默认背景色
        shareDefaultConfiguration.defaultNavBarBackColor = UIColor.whiteColor;
        //默认页面 背景色
        shareDefaultConfiguration.defaultControllerBackColor = nil;
        //导航条 按钮的默认配置
        shareDefaultConfiguration.defaultLeftItemImage = nil;
        shareDefaultConfiguration.defaultNavTitleColor = UIColor.blackColor;
        shareDefaultConfiguration.defaultNavTitleFont = [UIFont systemFontOfSize:12];
        
        //alert默认信息
        shareDefaultConfiguration.defaultMessageText = @"操作失败，请重试！";
        shareDefaultConfiguration.defaultSureText = @"确定";
        shareDefaultConfiguration.defaultCancelText = @"取消";
        
    });
    return shareDefaultConfiguration;
}
//用alloc返回也是唯一实例
+(id)allocWithZone:(struct _NSZone *)zone {
    return [DefaultConfiguration shareDefaultConfiguration] ;
}
//对对象使用copy也是返回唯一实例
-(id)copyWithZone:(NSZone *)zone {
    return [DefaultConfiguration shareDefaultConfiguration] ;//return _instance;
}
//对对象使用mutablecopy也是返回唯一实例
-(id)mutableCopyWithZone:(NSZone *)zone {
    return [DefaultConfiguration shareDefaultConfiguration] ; ;
}

@end
