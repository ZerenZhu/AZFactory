//
//  AZFactory.h
//  EFlashLoan-WCT
//
//  Created by AdaZhu on 12/07/2017.
//  Copyright © 2017 eflashloan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZFactory : NSObject
//创建一个按钮
+(UIButton *)btnWithFrame:(CGRect)frame
                     type:(UIButtonType)type
                    title:(NSString *)title
                 fontSize:(CGFloat)fontSize
               titleColor:(UIColor *)titleColor
                  bgColor:(UIColor *)bgColor
                    image:(NSString *)imageName
                   target:(id)target
                 selector:(SEL)sel
                superView:(UIView *)superView;
//添加一个左视图按钮
+(void)leftNavigationItemWithbtnFrame:(CGRect)frame
                                 type:(UIButtonType)type
                                title:(NSString *)title
                             fontSize:(CGFloat)fontSize
                           titleColor:(UIColor *)titleColor
                              bgColor:(UIColor *)bgColor
                                image:(NSString *)imageName
                               target:(id)target
                             selector:(SEL)sel;
//添加一个右视图按钮
+(void)rightNavigationItemWithbtnFrame:(CGRect)frame
                                  type:(UIButtonType)type
                                 title:(NSString *)title
                              fontSize:(CGFloat)fontSize
                            titleColor:(UIColor *)titleColor
                               bgColor:(UIColor *)bgColor
                                 image:(NSString *)imageName
                                target:(id)target
                              selector:(SEL)sel;
//创建一个label
+(UILabel *)labelWithFram:(CGRect)frame
                     text:(NSString *)text
                 fontSize:(CGFloat)fontSize
                textColor:(UIColor *)textcolor
                  bgColor:(UIColor *)bgColor
                    align:(NSTextAlignment)align
                superView:(UIView *)superView;
//创建一个文本框
+(UITextField *)textFieldWithFrame:(CGRect)frame
                               Tag:(int)tag
                           BgColor:(UIColor *)bgColor
                       Placeholder:(NSString *)placeholder
              ClearsOnBeginEditing:(BOOL)cOBE
                   ClearButtonMode:(UITextFieldViewMode)cbm
                      KeyboardType:(UIKeyboardType)kBT
                     ReturnKeyType:(UIReturnKeyType)rKT
                   SecureTextEntry:(BOOL)sTN
                         SuperView:(UIView *)superView;
//创建一个确定按钮的弹框
+(UIAlertController *)alertControllerWithType:(UIAlertControllerStyle)type
                                        Title:(NSString *)title
                                      Message:(NSString *)message
                                  submitTitle:(NSString *)submitTitle
                                  cancelTitle:(NSString *)cancleTitle
                                     Selector:(SEL)sel
                                       Target:(id)target;
+(UIAlertController *)alertControllerWithType:(UIAlertControllerStyle)type
                                        Title:(NSString *)title
                                      Message:(NSString *)message
                                 addTextField:(BOOL)addField
                                    TextField:(UITextField *)globalTextField
                         textFieldPlaceholder:(NSString *)placeholder
                                  submitTitle:(NSString *)submitTitle
                                  cancelTitle:(NSString *)cancleTitle
                                     Selector:(SEL)sel
                                       Target:(id)target;
+(UIAlertController *)alertControllerWithType:(UIAlertControllerStyle)type
                                        Title:(NSString *)title
                                      Message:(NSString *)message
                              firstSheetTitle:(NSString *)firstTitle
                             secondSheetTitle:(NSString *)secondTitle
                                  cancelTitle:(NSString *)cancelTitle
                                SelectorFirst:(SEL)sel1
                               SelectorSecond:(SEL)sel2
                                       Target:(id)target;
+(UIView *)viewWithFrame:(CGRect)frame
                 bgColor:(UIColor *)bgColor
               superView:(UIView *)superView;

+(UIView *)viewWithFrame:(CGRect)frame
                 bgColor:(UIColor *)bgColor
            cornerRadius:(CGFloat)cornerRadius
               superView:(UIView *)superView;

//创建一个下拉按钮
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
                superView:(UIView *)superView;
+(UIImageView *)imageViewWithFrame:(CGRect)frame
                             Image:(UIImage *)image
                         superView:(UIView*)superView;

+(NSString *)readQRCodeFromImage:(UIImage *)image;
+ (NSMutableAttributedString *)tranformAttributedStringFromString:(NSString *)string WithRange:(NSRange)range AndAttribute:(NSString *)attributeName Value:(id)value;

@end
