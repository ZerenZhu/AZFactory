//
//  AZFactory.m
//  EFlashLoan-WCT
//
//  Created by AdaZhu on 12/07/2017.
//  Copyright © 2017 eflashloan. All rights reserved.
//

#import "AZFactory.h"

@implementation AZFactory

+(UIButton *)btnWithFrame:(CGRect)frame
                     type:(UIButtonType)type
                    title:(NSString *)title
                 fontSize:(CGFloat)fontSize
               titleColor:(UIColor *)titleColor
                  bgColor:(UIColor *)bgColor
                    image:(NSString *)imageName
                   target:(id)target
                 selector:(SEL)sel
                superView:(UIView *)superView
{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.backgroundColor = bgColor;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:btn];
    btn.titleLabel.numberOfLines = 0;
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    return btn;
}
+(void)leftNavigationItemWithbtnFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor image:(NSString *)imageName target:(id)target selector:(SEL)sel{
    UIButton * btn = [self btnWithFrame:frame type:type title:title fontSize:fontSize titleColor:titleColor bgColor:bgColor image:imageName target:target selector:sel superView:nil];
    ((UIViewController *)target).navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
//    navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}
+(void)rightNavigationItemWithbtnFrame:(CGRect)frame type:(UIButtonType)type title:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor image:(NSString *)imageName target:(id)target selector:(SEL)sel{
    UIButton * btn = [self btnWithFrame:frame type:type title:title fontSize:fontSize titleColor:titleColor bgColor:bgColor image:imageName target:target selector:sel superView:nil];
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    ((UIViewController *)target).navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
//    navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}

+(UILabel *)labelWithFram:(CGRect)frame
                     text:(NSString *)text
                 fontSize:(CGFloat)fontSize
                textColor:(UIColor *)textcolor
                  bgColor:(UIColor *)bgColor
                    align:(NSTextAlignment)align
                superView:(UIView *)superView
{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor =textcolor;
    label.backgroundColor = bgColor;
    label.textAlignment = align;
    label.numberOfLines = 0;
    [superView addSubview: label];
    return label;
}


+(UITextField *)textFieldWithFrame:(CGRect)frame
                               Tag:(int)tag
                           BgColor:(UIColor *)bgColor
                       Placeholder:(NSString *)placeholder
              ClearsOnBeginEditing:(BOOL)cOBE
                   ClearButtonMode:(UITextFieldViewMode)cbm
                      KeyboardType:(UIKeyboardType)kBT
                     ReturnKeyType:(UIReturnKeyType)rKT
                   SecureTextEntry:(BOOL)sTN
                         SuperView:(UIView *)superView
{
    UITextField *field = [[UITextField alloc]initWithFrame:frame];
    field.tag = tag;
    field.backgroundColor = bgColor;
    field.placeholder = placeholder;
    field.clearsOnBeginEditing = cOBE;
    field.clearButtonMode = cbm;
    field.keyboardType = kBT;
    field.returnKeyType = rKT;
    field.secureTextEntry = sTN;
    [superView addSubview:field];
    return field;
}
+(UIAlertController *)alertControllerWithType:(UIAlertControllerStyle)type
                                        Title:(NSString *)title
                                      Message:(NSString *)message
                                  submitTitle:(NSString *)submitTitle
                                  cancelTitle:(NSString *)cancleTitle
                                     Selector:(SEL)sel
                                       Target:(id)target{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:type];
    UIAlertAction * oKAction = [UIAlertAction actionWithTitle:submitTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:sel withObject:nil];
#pragma clang diagnostic pop
        
    }];
    if (cancleTitle) {
        
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        
    }
    [alertController addAction:oKAction];
    [target presentViewController:alertController animated:YES completion:nil];
    return alertController;
}
+(UIAlertController *)alertControllerWithType:(UIAlertControllerStyle)type
                                        Title:(NSString *)title
                                      Message:(NSString *)message
                                 addTextField:(BOOL)addField
                                    TextField:(UITextField *)globalTextField
                         textFieldPlaceholder:(NSString *)placeholder
                                  submitTitle:(NSString *)submitTitle
                                  cancelTitle:(NSString *)cancleTitle
                                     Selector:(SEL)sel
                                       Target:(id)target{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:type];
    if (addField == YES) {
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = placeholder;
            textField.keyboardType = UIKeyboardTypeNumberPad;
        }];
    }
    UIAlertAction * oKAction = [UIAlertAction actionWithTitle:submitTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        globalTextField.text = alertController.textFields.lastObject.text;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:sel withObject:nil];
#pragma clang diagnostic pop
        
    }];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:oKAction];
    [alertController addAction:cancelAction];
    [target presentViewController:alertController animated:YES completion:nil];
    return alertController;
}
+(UIAlertController *)alertControllerWithType:(UIAlertControllerStyle)type
                                        Title:(NSString *)title
                                      Message:(NSString *)message
                              firstSheetTitle:(NSString *)firstTitle
                             secondSheetTitle:(NSString *)secondTitle
                                  cancelTitle:(NSString *)cancelTitle
                                SelectorFirst:(SEL)sel1
                               SelectorSecond:(SEL)sel2
                                       Target:(id)target{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:type];
    UIAlertAction * firstAction = [UIAlertAction actionWithTitle:firstTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:sel1 withObject:nil];
#pragma clang diagnostic pop
        
    }];
    if (secondTitle) {
        UIAlertAction * secondAction = [UIAlertAction actionWithTitle:secondTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [target performSelector:sel2 withObject:nil];
#pragma clang diagnostic pop
            
        }];
        [alertController addAction:secondAction];
        
    }
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:firstAction];
    [alertController addAction:cancelAction];
    [target presentViewController:alertController animated:YES completion:nil];
    return alertController;
}
+(UIButton *)btnWithFrame:(CGRect)frame
                     type:(UIButtonType)type
                    title:(NSString *)title
                 fontSize:(CGFloat)fontSize
               titleColor:(UIColor *)titleColor
                  bgColor:(UIColor *)bgColor
               boundWidth:(CGFloat)boundWidth
               boundColor:(UIColor*)boundColor
                    image:(NSString *)imageName
                   target:(id)target
                 selector:(SEL)sel
                superView:(UIView *)superView{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.backgroundColor = bgColor;
    btn.layer.borderWidth = boundWidth;
    btn.layer.borderColor = boundColor.CGColor;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:btn];
    return btn;
}
+(UIImageView *)imageViewWithFrame:(CGRect)frame
                             Image:(UIImage *)image
                         superView:(UIView*)superView{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = image;
    [superView addSubview:imageView];
    return imageView;
}

+(UIView *)viewWithFrame:(CGRect)frame
                 bgColor:(UIColor *)bgColor
               superView:(UIView *)superView{
    UIView * view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = bgColor;
    [superView addSubview:view];
    return view;
    
}

+(UIView *)viewWithFrame:(CGRect)frame
                 bgColor:(UIColor *)bgColor
            cornerRadius:(CGFloat)cornerRadius
               superView:(UIView *)superView{
    UIView * view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = bgColor;
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = YES;
    [superView addSubview:view];
    
    return view;
    
}

/**
 *  读取图片中二维码信息
 *
 *  @param image 图片
 *
 *  @return 二维码内容
 */
+(NSString *)readQRCodeFromImage:(UIImage *)image{
    NSData *data = UIImagePNGRepresentation(image);
    CIImage *ciimage = [CIImage imageWithData:data];
    if (ciimage) {
        CIDetector *qrDetector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:[CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer:@(YES)}] options:@{CIDetectorAccuracy : CIDetectorAccuracyHigh}];
        NSArray *resultArr = [qrDetector featuresInImage:ciimage];
        if (resultArr.count >0) {
            CIFeature *feature = resultArr[0];
            CIQRCodeFeature *qrFeature = (CIQRCodeFeature *)feature;
            NSString *result = qrFeature.messageString;
            
            return result;
        }else{
            return nil;
        }
    }else{
        return nil;
    }
}

+ (NSMutableAttributedString *)tranformAttributedStringFromString:(NSString *)string WithRange:(NSRange)range AndAttribute:(NSString *)attributeName Value:(id)value{
    if (range.length == 0) {
        return [[NSMutableAttributedString alloc]initWithString:@""];
    }
    NSMutableAttributedString * attrString = [[NSMutableAttributedString alloc]initWithString:string];
    [attrString addAttribute:attributeName value:value range:range];
    return attrString;
    
}

@end
