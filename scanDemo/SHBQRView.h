//
//  SHBQRView.h
//  QRCode_Demo
//
//  Created by 沈红榜 on 15/11/17.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SHBQRView;

@protocol SHBQRViewDelegate <NSObject>

- (void)qrView:(SHBQRView *)view ScanResult:(NSString *)result;

@end

@interface SHBQRView : UIView

@property (nonatomic, assign) id<SHBQRViewDelegate> delegate;

@property (nonatomic, assign, readonly) CGRect scanViewFrame;

- (void)startScan;
- (void)stopScan;


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

/**
 *  mlf-添加  只适用于iOS8之后
 *  从图片中读取二维码
 *
 *  @param qrimage 一张二维码图片
 *
 *  @return 二维码信息
 */
+ (NSString *)scQRReaderForImage:(UIImage *)qrimage NS_AVAILABLE_IOS(8_0);

@end
