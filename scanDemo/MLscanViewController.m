//
//  MLscanViewController.m
//  scanDemo
//
//  Created by applecaxa on 16/4/24.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import "MLscanViewController.h"
#import "SHBQRView.h"
#import "MlScanResultViewController.h"


@interface MLscanViewController ()<SHBQRViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation MLscanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //从相册选取二维码
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"相册" style:UIBarButtonItemStylePlain target:self action:@selector(toQRCode:)];
    
    
    SHBQRView *qrView = [[SHBQRView alloc] initWithFrame:self.view.bounds];
    qrView.delegate = self;
    [self.view addSubview:qrView];
    
    
}


- (void)qrView:(SHBQRView *)view ScanResult:(NSString *)result {
    
    
    [view stopScan]; //停止扫描
    
    //选中图片后先返回扫描页面，然后跳转到新页面进行展示
    if (![result isEqualToString:@""]) {
        //震动
        MlScanResultViewController *resultVC = [[MlScanResultViewController alloc]init];
        resultVC.content = result;
        [self.navigationController pushViewController:resultVC animated:YES];
    }else{
        NSLog(@"没扫到东西");
    }

}



- (void)toQRCode:(UIButton *)btn {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = true;
    [self presentViewController:picker animated:true completion:nil];
}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
        //方法一：
        UIImage *srcImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSString *result = [SHBQRView scQRReaderForImage:srcImage];


        __weak typeof(self) weakSelf = self;
        //选中图片后先返回扫描页面，然后跳转到新页面进行展示
        [self dismissViewControllerAnimated:YES completion:^{
            if (![result isEqualToString:@""]) {
                //震动
                MlScanResultViewController *resultVC = [[MlScanResultViewController alloc]init];
                resultVC.content = result;
                [weakSelf.navigationController pushViewController:resultVC animated:YES];
            }else{
                NSLog(@"没扫到东西");
            }
          
        }];
        
       
        
        
        
        //方法二：
//        UIImage *image = info[UIImagePickerControllerEditedImage];

//        if (!image) {
//            image = info[UIImagePickerControllerOriginalImage];
//        }
//        NSData *imageData = UIImageJPEGRepresentation(image, 1);
////         kCIContextUseSoftwareRenderer : 软件渲染 -- 可以消除 "BSXPCMessage received error for message: Connection interrupted" 警告
////         kCIContextPriorityRequestLow : 低优先级在 GPU 渲染-- 设置为false可以加快图片处理速度
//        CIContext *context = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @(true), kCIContextPriorityRequestLow : @(false)}];
//        
//        CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:nil];
//        CIImage *ciImage = [CIImage imageWithData:imageData];
//        
//        NSArray *ar = [detector featuresInImage:ciImage];
//        CIQRCodeFeature *feature = [ar firstObject];
//        NSLog(@"detector: %@", detector);
//        NSLog(@"context: %@", feature.messageString);
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"扫描结果：%@", feature.messageString ?: @"空"] preferredStyle:UIAlertControllerStyleAlert];
//        [alert addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleCancel handler:nil]];
//        [self presentViewController:alert animated:true completion:nil];
        
    }];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:true completion:nil];
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
