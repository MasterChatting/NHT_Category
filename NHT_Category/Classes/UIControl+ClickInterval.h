//
//  UIControl+ClickInterval.h
//  FireCloudDataPush
//
//  Created by NHT on 2019/12/12.
//  Copyright © 2019 HYXF. All rights reserved.
//

#import <UIKit/UIKit.h>
/**防止按钮连续点击 手动设置连续点击间隔*/
NS_ASSUME_NONNULL_BEGIN

@interface UIControl (ClickInterval)

/** **点击间隔 默认1秒*/
@property (nonatomic, assign) float  clickInterval;


@end

NS_ASSUME_NONNULL_END
