//
//  UIControl+ClickInterval.m
//  FireCloudDataPush
//
//  Created by NHT on 2019/12/12.
//  Copyright © 2019 HYXF. All rights reserved.
//

#import "UIControl+ClickInterval.h"
#import <objc/message.h>

static char * const mine_eventIntervalKey = "mine_eventIntervalKey";
static char * const eventUnavailableKey = "eventUnavailableKey";

@interface UIControl ()

/**是否可以相应点击事件*/
@property (nonatomic, assign) BOOL  eventUnavailable;

@end

@implementation UIControl (ClickInterval)


- (void)mine_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if([self isMemberOfClass:[UIButton class]]) {
        if (self.eventUnavailable == NO) {
            self.eventUnavailable = YES;
            [self mine_sendAction:action to:target forEvent:event];
            if (self.clickInterval <= 0) {
                self.clickInterval = 1;
            }
            [self performSelector:@selector(setEventUnavailable:) withObject:0 afterDelay:self.clickInterval];
        }
    }else {
        [self mine_sendAction:action to:target forEvent:event];
    }
}

+(void)load{
    Method method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method mine_Method = class_getInstanceMethod(self, @selector(mine_sendAction:to:forEvent:));
    method_exchangeImplementations(method, mine_Method);
}

#pragma mark---setter getter
-(float)clickInterval{
    return [objc_getAssociatedObject(self, mine_eventIntervalKey) floatValue];
}

-(void)setClickInterval:(float)clickInterval{
    objc_setAssociatedObject(self, mine_eventIntervalKey, @(clickInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BOOL)eventUnavailable {
    return [objc_getAssociatedObject(self, eventUnavailableKey) boolValue];
}

- (void)setEventUnavailable:(BOOL)eventUnavailable {
    objc_setAssociatedObject(self, eventUnavailableKey, @(eventUnavailable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
