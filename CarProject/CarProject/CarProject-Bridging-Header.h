//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

// MD5的头文件
#import <CommonCrypto/CommonCrypto.h>
// 微信支付
#import "WXApi.h"
// 支付宝
#import <AlipaySDK/AlipaySDK.h>
// 蓝牙
//#import "BabyBluetooth.h"

// 引入极光推送所需头文件
//#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

// 融云
//#import <RongIMKit/RongIMKit.h>

// 友盟
#import <UMMobClick/MobClick.h>
#import <UMSocialCore/UMSocialCore.h>

//高德地图
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

