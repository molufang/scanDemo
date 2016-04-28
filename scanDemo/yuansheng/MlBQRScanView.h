//
//  MlBQRScanView.h
//  scanDemo
//
//  Created by mlf on 16/4/28.
//  Copyright © 2016年 mlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MlBQRScanView : UIView
/**
 *  mlf-添加
 *  根据给定的字符串生成一个给定尺寸的二维码image
 *
 *  @param qrString 二维码的内容
 *  @param size     二维码生成后的尺寸大小
 *
 *  @return 二维码
 */
+ (UIImage *)scQRCodeForString:(NSString *)qrString size:(CGFloat)size;
@end
