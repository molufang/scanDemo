//
//  MlScanResultViewController.m
//  scanDemo
//
//  Created by mlf on 16/4/28.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "MlScanResultViewController.h"

@interface MlScanResultViewController ()
{
    UIWebView *webView;
}

@end

@implementation MlScanResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnClick)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    self.navigationItem.title = @"扫描结果";
    
    NSLog(@"content:%@",self.content);
    NSString *emailRegex = @"\\bhttps?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if ([emailTest evaluateWithObject:self.content]) {
        webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_content]]];
        [self.view addSubview:webView];
    }else{
        //先计算label所需高度
        CGRect tmpRect = [self.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:18.0],NSFontAttributeName, nil] context:nil];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, tmpRect.size.height)];
        label.text = self.content;
        label.font = [UIFont systemFontOfSize:16.0];
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        [self.view addSubview:label];
    }
}

- (void)leftBtnClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
