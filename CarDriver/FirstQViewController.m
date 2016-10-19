//
//  FirstViewController.m
//  CarDriver
//
//  Created by jinfeng.du on 16/10/8.
//  Copyright © 2016年 Qunar. All rights reserved.
//

#import "FirstQViewController.h"
#import "HYViewController.h"
//#import "RCTBridgeModule.h"

@interface FirstQViewController ()

@property (nonatomic, strong) HYViewController *mainVC;

@end

@implementation FirstQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 400)];
    [subView setBackgroundColor:[UIColor redColor]];
    [subView setClipsToBounds:NO];
//    [self.view addSubview:subView];
    
    NSString *loadingUrl = @"http://carbeta.qunar.com/h5/index/index.html?uuid=&hybridid=mob_hcar&nfrom=25";
    loadingUrl = @"http://www.baidu.com";
    loadingUrl = @"http://localhost:63342/untitled1/src/index.html";
    loadingUrl = @"http://localhost:9661";
    self.mainVC = [[HYViewController alloc] initWithName:@"manVC"];
    [self.mainVC setMainURLRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:loadingUrl]]];
    self.mainVC.notAutoHideloadView = YES;//touch 来管理
    
    [self.view addSubview:self.mainVC.view];
    @weakify(self);
    [self.mainVC hideNaviBarInTime:0.0 withOffSet:0.0 completion:^{
        @strongify(self);
        self.mainVC.hybridView.height = self.view.height - 39;
        [self.mainVC.view setHeight:self.view.height - 39];
    }];
    
    
//    NSURL *url =[NSURL URLWithString:loadingUrl];
//    NSURLRequest *request =[NSURLRequest requestWithURL:url];
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
//    [webView loadRequest:request];
//    [subView addSubview:webView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
