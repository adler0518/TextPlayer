//
//  Debug.h
//  QunariPhone
//
//  Created by Neo on 11/14/12.
//  Copyright (c) 2012 Qunar.com. All rights reserved.
//

#ifndef QunariPhone_Debug_h
#define QunariPhone_Debug_h

// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// 叹号范围内容请勿随意更改，更改请周知Leader
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define	kQunarTravelAppName							@"去哪儿旅行"

// ==================================================================
// 微信APPID
// ==================================================================
#define kQunarWechatAppID                           @"wx065b247a5e4d0ee7"

// ==================================================================
// URL Scheme 配置 不要进行更改
// ==================================================================
#define kQunariPhoneAlipayScheme					@"QunarAlipay"
#define kQunariPhoneJumpScheme						@"QunariPhone"
#define kQunariPhoneWechatScheme                    kQunarWechatAppID
#define kQunarIPhoneCtripScheme						@"QAuth"

// ==================================================================
// 加密的一些参数
// ==================================================================
#define kParamKeyVersion                                @"ivy"

// ==================================================================
//                      !!! Debug打包配置 !!!
// ==================================================================
#define	kNetworkTaskDIP									@"10010"

// 编译参数自定义CID
#ifndef CUSTOM_PACKAGE_VID
    #define kNetworkTaskDIV								@"80011123"
#else
    #define kNetworkTaskDIV								CUSTOM_PACKAGE_VID
#endif // #ifndef CUSTOM_PACKAGE_VID

// 编译参数自定义CID
#ifndef CUSTOM_PACKAGE_CID
    #define kNetworkTaskDIC								@"C1001"
#else
    #define kNetworkTaskDIC								CUSTOM_PACKAGE_CID
#endif // #ifndef CUSTOM_PACKAGE_CID


// Pitcher代理的服务器地址
#define kNetworkProxyServer                             @"http://front.pitcher.beta.qunar.com/pitcher-proxy"

// 编译参数自定义服务器地址
#ifndef CUSTOM_SERVER_URL

// 开发调试切换Server地址
#define kNetworkTaskServer                            @"http://pitcher.corp.qunar.com/fca"
//#define kNetworkTaskServer                            @"http://192.168.30.254:8095/fca"
//#define kNetworkTaskServer							@"http://clientdev.wap.cn6.qunar.com/wap12/htd2/ca"
//#define kNetworkTaskServer							@"http://clientdev.wap.cn6.qunar.com/wap12/htd1/ca"
//#define kNetworkTaskServer							@"http://wapdev7.wap.cn6.qunar.com/htd1/ca"
//#define kNetworkTaskServer							@"http://clientdev.wap.cn6.qunar.com/hr4/htd2/ca"
//#define kNetworkTaskServer							@"http://clientdev.wap.cn6.qunar.com/wap12/htd1/ca"
//#define kNetworkTaskServer						 	@"http://sfs1.beta.cn6.qunar.com/ca"
//#define kNetworkTaskServer	                        @"http://wap8.beta.cn6.qunar.com/ca"
//#define kNetworkTaskServer	                        @"http://wap15.beta.cn6.qunar.com/ca"
//#define kNetworkTaskServer	                        @"http://wap13.beta.cn6.qunar.com/ca"
//#define kNetworkTaskServer	                        @"http://client1.beta.cn6.qunar.com/ca"
//#define kNetworkTaskServer							@"http://wapdev8.wap.cn6.qunar.com/htd1/ca"
//#define kNetworkTaskServer                            @"http://l-car4.wap.dev.cn6.qunar.com:8188"
//#define kNetworkTaskServer                            @"http://clientdev.wap.cn6.qunar.com/hr4/htd2/ca"
//#define kNetworkTaskServer                            @"http://clientdev.wap.cn6.qunar.com/mhr3/htd1/ca"
//#define kNetworkTaskServer	                        @"http://client1.beta.cn6.qunar.com/ca"
//#define kNetworkTaskServer	                        @"http://client3.beta.cn6.qunar.com/ca"
//#define kNetworkTaskServer	                        @"http://mflighta.beta.qunar.com/ca"
//#define kNetworkTaskServer                            @"http://clientdev.wap.cn6.qunar.com/hb/h15/htd1/ca"

#else // #ifndef CUSTOM_SERVER_URL

    // 自动化打包切换Server地址
    #define kNetworkTaskServer							CUSTOM_SERVER_URL

#endif // #ifndef CUSTOM_SERVER_URL

#define kNetworkPicUploadServer							@"http://ud.client.qunar.com/ud"

// 身边服务器地址
#define kNetworkLifeDomain								@"http://live.qunar.com/wise/index"

// 支付扫码服务器地址
#define kNetworkQRCodeServer                            @"https://mpkq.qunar.com"

#define kQPatchKey                                      @"z713n4L6" //qunar_iphone


#endif // #ifndef QunariPhone_Debug_h


