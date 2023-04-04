//
//  UITextView+NoGap.m
//  FireCloudDataPush
//
//  Created by NHT on 2021/10/15.
//  Copyright © 2021 HYXF. All rights reserved.
//

#import "UITextView+NoGap.h"

@implementation UITextView (NoGap)

#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
-(instancetype)init{
    if (self =  [super init]) {
        //  设置 textview的文字距离边框上下左右都为0
        self.textContainer.lineFragmentPadding = 0;
        self.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}

@end
