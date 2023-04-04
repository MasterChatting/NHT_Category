//
//  UITextView+NoGap.h
//  FireCloudDataPush
//
//  Created by NHT on 2021/10/15.
//  Copyright © 2021 HYXF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 目前只支持初始化使用init时生效，使用initwithframe不生效
 */
/// 设置 textview的文字距离边框上下左右都为0
@interface UITextView (NoGap)

@end

NS_ASSUME_NONNULL_END
