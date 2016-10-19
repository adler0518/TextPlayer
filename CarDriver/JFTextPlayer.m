//
//  JFTextPlayer.m
//  CarDriver
//
//  Created by jinfeng.du on 16/10/19.
//  Copyright © 2016年 Qunar. All rights reserved.
//

#import "JFTextPlayer.h"

#define kFunctionNameStr [NSString stringWithCString:__func__ encoding:NSUTF8StringEncoding]
#define DEBUG_LOG NSLog(@"%@", kFunctionNameStr);


@implementation JFTextPlayer

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance setDefaultWithVolume:-1.0 rate:-1.0 pitchMultiplier:-1.0];
    });
    return sharedInstance;
}

//播放声音

-(void)play:(NSString *)string
{
    if(string && string.length <= 0){
        string = @"请输入需要播报的文字";
    }
    
    if (!self.qPlayer) {
        AVSpeechSynthesizer *player  = [[AVSpeechSynthesizer alloc]init];
        player.delegate = self;
        
        self.qPlayer = player;
    }
    
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:string];//设置语音内容
    
    utterance.voice  = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];//设置语言
    
    utterance.rate   = self.rate;  //设置语速（0.0~1.0）
    
    utterance.volume = self.volume;  //设置音量（0.0~1.0）默认为1.0
    
    utterance.pitchMultiplier    = self.pitchMultiplier;  //设置语调 (0.5-2.0)
    
    utterance.postUtteranceDelay = 0.2; //目的是让语音合成器播放下一语句前有短暂的暂停
    
    [self.qPlayer speakUtterance:utterance];
    
}



//初始化配置

/**
 
 *  设置播放的声音参数 如果选择默认请传入 -1.0
 
 *
 
 *  @param aVolume          音量（0.0~1.0）默认为1.0
 
 *  @param aRate            语速（0.0~1.0）默认为0.2
 
 *  @param aPitchMultiplier 语调 (0.5-2.0) 默认为1.0
 
 */

-(void)setDefaultWithVolume:(float)aVolume rate:(CGFloat)aRate pitchMultiplier:(CGFloat)aPitchMultiplier
{
    self.rate   = aRate;
    self.volume = aVolume;
    self.pitchMultiplier = aPitchMultiplier;
    
    if (aRate == -1.0) {
        self.rate = 0.2;
    }
    
    if (aVolume == -1.0) {
        self.volume = 1;
    }
    
    if (aPitchMultiplier == -1.0) {
        self.pitchMultiplier = 1;
    }
    
}


#pragma mark - <AVSpeechSynthesizerDelegate>
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance
{
    DEBUG_LOG
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    DEBUG_LOG
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance
{
    DEBUG_LOG
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance
{
    DEBUG_LOG
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance
{
    DEBUG_LOG
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance
{
//    DEBUG_LOG
}

@end
