//
//  SecondViewController.m
//  CarDriver
//
//  Created by jinfeng.du on 16/10/8.
//  Copyright © 2016年 Qunar. All rights reserved.
//

#import "SecondViewController.h"
#import "JFTextPlayer.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)say
{
    JFTextPlayer *player = [JFTextPlayer sharedInstance];
    
//    [player setDefaultWithVolume:-1.0 rate:0.4 pitchMultiplier:-1.0];
    
    NSLog(@"isSpeaking:%d, isPaused:%d", player.qPlayer.isSpeaking, player.qPlayer.isPaused);
    
    [player play:[self.wordText text]];
}

-(IBAction)rateChange:(UISlider *)slider {
//    NSLog(@"rate value:%f", slider.value);
    self.aRoteLabel.text = [NSString stringWithFormat:@"%0.2f", slider.value];
    JFTextPlayer *player = [JFTextPlayer sharedInstance];
    [player setDefaultWithVolume:player.volume rate:[slider value] pitchMultiplier:player.pitchMultiplier];
}

-(IBAction)pitchMultiplierChange:(UISlider *)slider {
//    NSLog(@"pitch value:%f", slider.value);
    self.pitchLabel.text = [NSString stringWithFormat:@"%.2f", slider.value];
    JFTextPlayer *player = [JFTextPlayer sharedInstance];
    [player setDefaultWithVolume:player.volume rate:player.rate pitchMultiplier:[slider value]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
