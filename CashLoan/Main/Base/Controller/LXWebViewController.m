//
//  LXWebViewController.m
//  DNXB
//
//  Created by lixu on 2017/3/16.
//  Copyright © 2017年 dnxb. All rights reserved.
//

#import "LXWebViewController.h"

@interface LXWebViewController () <UIWebViewDelegate>

@property (nonatomic, weak)UIWebView *webView;

@end

@implementation LXWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleStr = self.webTitle;
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    webView.scalesPageToFit = YES;
    webView.scrollView.bounces = NO;
    webView.delegate = self;
    [self.view addSubview:webView];
    self.webView = webView;

    NSURL * url = [NSURL URLWithString:self.urlStr];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark -- UIWebViewDelegate委托定义方法

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *path =  [[request URL] absoluteString];
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0) {
        path = [path stringByRemovingPercentEncoding];
    }else{
        path = [path stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    if ([path hasPrefix:@"ios"]||[path hasPrefix:@"objc"]) {
        NSString *method = [path substringFromIndex:@"objc://".length];
        NSArray *sels = [method componentsSeparatedByString:@"#param#"];
        SEL todoM;
        if (sels.count>1) {
            todoM = NSSelectorFromString([NSString stringWithFormat:@"%@:",sels[0]]);
            NSMutableArray *params = [NSMutableArray array];
            for (int i=1; i<sels.count; i++) {
                [params addObject:sels[i]];
            }
            if ([self respondsToSelector:todoM]) {
                [self performSelector:todoM withObject:params afterDelay:0];
            }
        }else if(sels.count==1){
            todoM = NSSelectorFromString([NSString stringWithString:sels[0]]);
            if ([self respondsToSelector:todoM]) {
                [self performSelector:todoM withObject:nil afterDelay:0];
            }
        }
        return NO;
    }
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webview,StartLoad");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webview,FinishLoad");
    [self deletePrompt];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"webview,FailLoad:%@", error);
}

#pragma mark - private methods

//用于js统计
- (void)jsStatistics
{
    NSString *systemUserAgent = [self.webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    
    if (!([systemUserAgent rangeOfString:@"****-app-iphone Version/"].length > 0)) {
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleVersionKey];
        systemUserAgent = [systemUserAgent stringByAppendingFormat:@" ***-app-iphone Version/%@", currentVersion];
    }
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:systemUserAgent, @"UserAgent", nil];
    [kUserDefaults registerDefaults:dictionary];
}

//禁止复制
- (void)deletePrompt
{
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
}

- (void)setWebTitle:(NSString *)webTitle
{
    _webTitle = webTitle;
    self.titleStr = webTitle;
}

@end





