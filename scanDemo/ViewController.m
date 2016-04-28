//
//  ViewController.m
//  scanDemo
//
//  Created by applecaxa on 16/4/24.
//  Copyright © 2016年 mlf. All rights reserved.


#import "ViewController.h"
#import "MLscanViewController.h"
#import "QRCScannerViewController.h"
#import "CodeGenerateViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)scanOriginAction:(id)sender {
    
    
    MLscanViewController *scan = [[MLscanViewController alloc]init];
    [self.navigationController pushViewController:scan animated:YES];
    
    
    
    
    
}

- (IBAction)scanAction:(id)sender {
    
//    SubLBXScanViewController *vc = [SubLBXScanViewController new];
//    [self.navigationController pushViewController:vc animated:YES];

    QRCScannerViewController *qrcVC = [[QRCScannerViewController alloc]init];
    [self.navigationController pushViewController:qrcVC animated:YES];
    
}


- (IBAction)codeGenerate:(id)sender {
    
    
    
    CodeGenerateViewController *codeVC = [[CodeGenerateViewController alloc]init];
    [self.navigationController pushViewController:codeVC animated:YES];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
