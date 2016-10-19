//
//  JFTextPlayer.h
//  CarDriver
//
//  Created by jinfeng.du on 16/10/19.
//  Copyright © 2016年 Qunar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface JFTextPlayer : NSObject <AVSpeechSynthesizerDelegate>

@property(nonatomic,assign)float rate;   //语速

@property(nonatomic,assign)float volume; //音量

@property(nonatomic,assign)float pitchMultiplier;  //音调

@property(nonatomic,assign)BOOL  autoPlay;  //自动播放


@property(nonatomic,strong) AVSpeechSynthesizer *qPlayer;


//类方法实例出对象

+ (instancetype)sharedInstance;

//基础设置，如果有别的设置，也很好实现

-(void)setDefaultWithVolume:(float)aVolume rate:(CGFloat)aRate pitchMultiplier:(CGFloat)aPitchMultiplier;

//播放并给出文字

-(void)play:(NSString *)string;

@end

