//
//  ViewController.h
//  WindjsUsageSample
//
//  Created by TangQiao on 12-8-28.
//  Copyright (c) 2012年 TangQiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
