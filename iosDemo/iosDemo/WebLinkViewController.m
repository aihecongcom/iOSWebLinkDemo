//
//  WebLinkViewController.m
//  HecongDemo
//
//  Created by 合从 on 2020/6/8.
//  Copyright © 2020 合从. All rights reserved.
//

#import "WebLinkViewController.h"
#import <WebKit/WebKit.h>
@interface WebLinkViewController ()<WKNavigationDelegate>
@property(strong,nonatomic) WKWebView * webview;
@end

@implementation WebLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    _webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
    _webview.navigationDelegate = self;
    [self.view addSubview:_webview];
    //设置顾客资料
    NSDictionary * Dic = @{@"设备信息":@"1",
                       @"名称":@"张先生",
                       @"手机":@"123456789",
                       @"邮箱":@"123456789@email",
                       @"会员ID":@123456789
//                          @"会员等级":@"1l"
    };
    //字典转字符串 字符串中包含中文处理
    NSString * DicStr =
    [[self dictionaryToJson:Dic] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //顾客资料customer=DicStr的方式拼接在Url后面  headHidden=1 不传则默认带头部,聊天界面是否带头部传则不带头部，
    NSString * urlStr;
    //urlStr = https://团队ID.ahc.ink/chat.html?customer=DicStr
    if (self.ishead == YES) {
        //带头部
     urlStr = [NSString stringWithFormat:@"https://10003.ahc.ink/chat.html?customer=%@",DicStr];
    }else{
    //不带头部
     urlStr = [NSString stringWithFormat:@"https://10003.ahc.ink/chat.html?customer=%@&%@",DicStr,@"headHidden=1"];
    }
    
//    @"https://10003.ahc.ink/chat.html?headHidden=1&customer=";
    NSURL * url  = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [_webview loadRequest:request];
}
//字典转字符串
-(NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

#pragma mark - WKUIDelegate
// Decides whether to allow or cancel a navigation.  打开外部链接
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSLog(@"%@", webView.URL);
    NSLog(@"%@", navigationAction.request.URL);
    NSURL *url = navigationAction.request.URL;
    
    if ([url.absoluteString hasPrefix:@"http"]) {
        // The target frame, or nil if this is a new window navigation.
        if (!navigationAction.targetFrame) {
//            [webView loadRequest:navigationAction.request];
                    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
        decisionHandler(WKNavigationActionPolicyAllow);
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}
@end
