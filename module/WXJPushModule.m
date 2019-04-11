//
//  WXJPushModule.m
//  AFNetworking
//
//  Created by 郑江荣 on 2018/5/24.
//

#import "WXJPushModule.h"
#import "WXJPushModule.h"
#import "JPushManager.h"
#import <WeexPluginLoader/WeexPluginLoader.h>
WX_PlUGIN_EXPORT_MODULE(jpush, WXJPushModule)
@implementation WXJPushModule

@synthesize weexInstance;

WX_EXPORT_METHOD_SYNC(@selector(getJPushId))
WX_EXPORT_METHOD_SYNC(@selector(regist:callback:))
 
-(NSString*)getJPushId
{
    
    NSString *jid=[JPUSHService registrationID];
     return jid;
   
}

-(void)regist:(NSDictionary*)param callback:(WXModuleCallback)callback{
    NSString *appkey=param[@"appkey"];
    NSString *channel=param[@"channel"];
    [JPUSHService setupWithOption:nil appKey:appkey
                          channel:channel
                 apsForProduction:true
            advertisingIdentifier:nil];
    
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:[JPushManager sharedManager]];
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        NSLog([@"registrationID="add: registrationID]);
        callback(@{@"err":@(resCode),@"id":registrationID});
    }];
}

@end
