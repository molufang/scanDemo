//
//  CodeGenerateViewController.m
//  scanDemo
//
//  Created by mlf on 16/4/28.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "CodeGenerateViewController.h"
//#import "SHBQRView.h"
#import "MlBQRScanView.h"
@interface CodeGenerateViewController ()

@end

@implementation CodeGenerateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 90, 150, 150)];
    [self.view addSubview:imageView];
    
    
    //生成二维码
//    imageView.image = [SHBQRView scQRCodeForString:@"http://www.baidu.com" size:imageView.bounds.size.width];
    imageView.image = [MlBQRScanView scQRCodeForString:@"http://www.baidu.com" size:imageView.bounds.size.width];

    
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
