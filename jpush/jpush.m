//
//  jpush.m
//  jpush
//
//  Created by 郑江荣 on 2018/5/24.
//  Copyright © 2018年 郑江荣. All rights reserved.
//

#import "jpush.h"
#import <AdSupport/AdSupport.h>
#import <WeexSDK/WXSDKInstance.h>
#import <WeexSDK/WXSDKEngine.h>
#import "WXJPushModule.h"
#import "JPushManager.h"
#import "farwolf_weex.h"


WX_PLUGIN_Entry(jpush)
@implementation jpush



+(instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static jpush *instance;
    dispatch_once(&onceToken, ^{
        instance = [[jpush alloc] init];
    });
    return instance;
}

-(void)initEntry:(NSMutableDictionary*)lanchOption
{
    [[JPushManager sharedManager] initHanler];
}




@end
