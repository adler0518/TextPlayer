//
//  SecondViewController.h
//  CarDriver
//
//  Created by jinfeng.du on 16/10/8.
//  Copyright © 2016年 Qunar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *aRoteSlider;
@property (weak, nonatomic) IBOutlet UILabel *aRoteLabel;
@property (weak, nonatomic) IBOutlet UILabel *pitchLabel;

@property(nonatomic, retain) IBOutlet UITextField *wordText;

@end

