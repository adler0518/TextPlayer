//
//  AppDelegate+AppInfo.m
//  CarDriver
//
//  Created by qitmac000260 on 16/10/8.
//  Copyright © 2016年 Qunar. All rights reserved.
//

#import "AppDelegate+AppInfo.h"
#import "Debug.h"
#import "SSKeychain.h"
#import "JumpHandle.h"
#import "NSString+Utility.h"

//static NetConnection *globalAppLoginConnect = nil;
static NSString *qunarAppVID = nil;
static NSString *serverUrlString = nil;
static NSString *proxyUrlString = nil;
static BOOL isShowingPushAuthGuide = NO;

@implementation AppDelegate (AppInfo)

// =======================================================================
#pragma mark - 保存信息共享给 extension
// =======================================================================
// 保存信息共享给 extension
- (void)syncExtension
{
    // 保存信息共享给 extension
    if ([[NSFileManager defaultManager] respondsToSelector:@selector(containerURLForSecurityApplicationGroupIdentifier:)])
    {
        NSString *groupUrl = [[[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:[NSString getAppGroupID]] relativePath];
        if ([AppInfo appIID] != nil)
        {
            [[AppInfo appIID] writeToFile:[groupUrl stringByAppendingPathComponent:@"appUID.dat"] atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
        if ([AppInfo appAID] != nil)
        {
            [[AppInfo appAID] writeToFile:[groupUrl stringByAppendingPathComponent:@"deviceUID.dat"] atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
        if ([AppInfo appGID] != nil)
        {
            [[AppInfo appGID] writeToFile:[groupUrl stringByAppendingPathComponent:@"appGID.dat"] atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
        if ([AppInfo appSID] != nil)
        {
            [[AppInfo appSID] writeToFile:[groupUrl stringByAppendingPathComponent:@"appSID.dat"] atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
    }
}

// =======================================================================
#pragma mark - AppInfoPrt
// =======================================================================
// appName
+ (NSString *)appName
{
    return kQunarTravelAppName;
}

// appGroupID
+ (NSString *)appGroupID
{
    //获取Bundle identifier
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [dic objectForKey:@"CFBundleIdentifier"];
    
    // 查找第一个点
    NSRange firstRange = [appName rangeOfString:@"."];
    NSRange lastRange = [appName rangeOfString:@"." options:NSBackwardsSearch];
    
    // 连接字符串
    NSString *appGroupName;
    NSString *subString;
    
    if (firstRange.location != NSNotFound) {
        // 取第一个点及后面的内容
        subString = [appName substringWithRange:NSMakeRange(firstRange.location, [appName length]-firstRange.location)];
        appGroupName = [@"group" stringByAppendingString:subString];
        lastRange = [appGroupName rangeOfString:@"." options:NSBackwardsSearch];
        
        if (lastRange.location != NSNotFound) {
            appGroupName = [appGroupName substringWithRange:NSMakeRange(0, lastRange.location)];
        }
        
    }
    
    return appGroupName;
}

// vid
+ (NSString *)appVID
{
//#if (BETA_BUILD == 1)
//#warning beta build enable
//    if (qunarAppVID == nil)
//    {
//        NSString *requestClientUrlScheme = @"commonbusiness/getclientappvid";
//        NSURL *requestClientUrl = [NSURL URLWithString:[AppInfo appQunarIPhoneSchemeString:requestClientUrlScheme]];
//        [JumpHandle jumpHandleOpenURL:requestClientUrl
//                          withUrlData:nil responseDelg:(AppDelegate *)[[UIApplication sharedApplication] delegate] userInfo:@"appVID"];
//    }
//    
//    if ([qunarAppVID isStringSafe])
//    {
//        return qunarAppVID;
//    }
//#endif
    
    return kNetworkTaskDIV;
}

// pid
+ (NSString *)appPID
{
    return kNetworkTaskDIP;
}

// cid
+ (NSString *)appCID
{
    return kNetworkTaskDIC;
}

// uid
+ (NSString *)appUID
{
#if TARGET_IPHONE_SIMULATOR
    NSString *deviceID = @"0000000000000000000000000000000000000000";
#elif TARGET_OS_IPHONE
    NSString *deviceID = [AppInfo macAddress];
    
    if ([deviceID isEqualToString:@"02:00:00:00:00:00"] || (deviceID == nil))
    {
        deviceID = [AppInfo appIID];
    }
#endif
    
    return deviceID;
}

// iid
+ (NSString *)appIID
{
    //获取keychain的IID
    NSString *appIIDFromKeychain = [SSKeychain passwordForService:@"com.qunar.qunarclient8"account:@"iid"];
    
    if (appIIDFromKeychain != nil && [appIIDFromKeychain length] > 0)
    {
        return appIIDFromKeychain;
    }
    else
    {
        if([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)])
        {
            NSString *iidStr = nil;
            iidStr = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            if (iidStr != nil && [iidStr length] > 0)
            {
                //保存Keychain
                if ([SSKeychain setPassword:iidStr forService:@"com.qunar.qunarclient8" account:@"iid"] == YES)
                {
                    [(AppDelegate *)[[UIApplication sharedApplication] delegate] syncExtension];
                }
                
                return iidStr;
            }
        }
    }
    
    return nil;
}

// 机器的唯一标识
+ (NSString *)appAID
{
    //获取keychain的AID
    NSString *appAIDFromKeychain = [SSKeychain passwordForService:@"com.qunar.qunarclient8"account:[[NSString alloc] initWithFormat:@"%@-%@", [AppInfo appPID], @"aid"]];
    
    if (appAIDFromKeychain != nil && [appAIDFromKeychain length] > 0)
    {
        return appAIDFromKeychain;
    }
    else
    {
        if([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)])
        {
            // 产生唯一标识
            CFUUIDRef puuid = CFUUIDCreate(nil);
            CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
            NSString *appAIDNew = (__bridge_transfer  NSString *)CFStringCreateCopy(NULL, uuidString);
            CFRelease(puuid);
            CFRelease(uuidString);
            
            if (appAIDNew != nil && [appAIDNew length] > 0)
            {
                //保存Keychain
                if ([SSKeychain setPassword:appAIDNew forService:@"com.qunar.qunarclient8" account:[[NSString alloc] initWithFormat:@"%@-%@", [AppInfo appPID], @"aid"]] == YES)
                {
                    [(AppDelegate *)[[UIApplication sharedApplication] delegate] syncExtension];
                }
                
                return appAIDNew;
            }
        }
    }
    
    return nil;
}

// vendorUID
+ (NSString *)vendorUID
{
    // UID
#if TARGET_IPHONE_SIMULATOR
    NSString *deviceID = @"0000000000000000000000000000000000000000";
#elif TARGET_OS_IPHONE
    NSString *deviceID = [AppInfo macAddress];
    
    if ([deviceID isEqualToString:@"02:00:00:00:00:00"] || (deviceID == nil))
    {
        return [AppInfo appIID];
    }
#endif
    
    return deviceID;
}

// deviceUID
+ (NSString *)deviceUID
{
    return [AppInfo appAID];
}

// 加密版本
+ (NSString *)keyVersion
{
    return kParamKeyVersion;
}

// Pitcher代理服务器地址
+ (NSString *)proxyURL
{
//#if (BETA_BUILD == 1)
//    if (proxyUrlString == nil)
//    {
//        NSString *requestClientUrlScheme = @"commonbusiness/getClientProxyUrl";
//        NSURL *requestClientUrl = [NSURL URLWithString:[AppInfo appQunarIPhoneSchemeString:requestClientUrlScheme]];
//        [JumpHandle jumpHandleOpenURL:requestClientUrl
//                          withUrlData:nil responseDelg:(AppDelegate *)[[UIApplication sharedApplication] delegate] userInfo:@"proxyURL"];
//    }
//    
//    if ([proxyUrlString isStringSafe])
//    {
//        return proxyUrlString;
//    }
//#endif
    
    return kNetworkProxyServer;
}

// 服务器地址
+ (NSString *)serverURL
{
//#if (BETA_BUILD == 1)
//    if (serverUrlString == nil)
//    {
//        NSString *requestClientUrlScheme = @"commonbusiness/getClientServerUrl";
//        NSURL *requestClientUrl = [NSURL URLWithString:[AppInfo appQunarIPhoneSchemeString:requestClientUrlScheme]];
//        [JumpHandle jumpHandleOpenURL:requestClientUrl
//                          withUrlData:nil responseDelg:(AppDelegate *)[[UIApplication sharedApplication] delegate] userInfo:@"serverURL"];
//    }
//    
//    if ([serverUrlString isStringSafe])
//    {
//        return serverUrlString;
//    }
//#endif
    
    return kNetworkTaskServer;
}


// 图片上传服务器地址
+ (NSString *)picUploadServer
{
    return kNetworkPicUploadServer;
}

// 获取当前APP的Scheme跳转协议头
+ (NSString *)QunarIPhoneScheme
{
    return kQunariPhoneJumpScheme;
}

// 获取当前APP的携程Scheme跳转协议头
+ (NSString *)QunarIPhoneCtripScheme{
    return kQunarIPhoneCtripScheme;
}

// 获取当前APP的支付宝Scheme跳转协议头
+ (NSString *)QunarIPhoneAlipayScheme
{
    return kQunariPhoneAlipayScheme;
}

// 获取当前APP的微信Scheme跳转协议头
+ (NSString *)QunarIPhoneWechatScheme
{
    return kQunariPhoneWechatScheme;
}

@end
