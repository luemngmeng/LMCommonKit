//
//  LMStringUtil.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/25/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMStringUtil.h"
#import <UIKit/UIKit.h>

@implementation LMStringUtil

#pragma mark - Public Methods
#pragma mark  判断字符串是否为空
+ (BOOL)isEmptyStringWith:(NSString *)string {
    
    if (string == nil || string.length == 0 || [string isEqual:[NSNull null]]) {
        return YES;
    }
    
    return NO;
}



#pragma mark 判断字符串是否是手机号码(不用正则表达式)
+ (BOOL)checkMobileNumberWith:(NSString *)mobileNumber {
    
    if ([LMStringUtil isEmptyStringWith:mobileNumber]) {
        return NO;
    }
    
    
    if ([mobileNumber length] != INPUT_PHONE_NUMBER_LENGTH) {
        return NO;
    }
    
    NSString * mobileFormat = @"^((13[0-9])|(17[0-9])|(15[^(4,\\D)])|(18[0-9]))\\d{8}$";
    NSPredicate *regexMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileFormat];

    if ([regexMobile evaluateWithObject:mobileNumber]) {

        return YES;
    } else {
        return NO;
    }
    
}



#pragma mark 判断字符串是否是电话号码
+ (BOOL)checkTelephoneNumberWith:(NSString *)telephoneNumber
{
    
    if ([LMStringUtil isEmptyStringWith:telephoneNumber]) {
        return NO;
    }
    
    
    NSString * mobileFormat = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regexMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileFormat];
    if ([regexMobile evaluateWithObject:telephoneNumber]) {
        
        return YES;
    } else {
        
        return NO;
    }
    
}



#pragma mark 判断是否是身份证号
+ (BOOL)checkVerificationCodeWith:(NSString *)astr {
    
    if ([LMStringUtil isEmptyStringWith:astr]) {
        return NO;
    }
    
    NSScanner* scan = [NSScanner scannerWithString:astr];
    int val;
    
    if([scan scanInt:&val] && [scan isAtEnd] && astr.length == INPUT_SMS_VERIFICATION_CODE_LENGTH) {
       return YES;
    }else {
       return NO;
    }
}



#pragma mark 判断是否是身份证号
+ (BOOL)isValidateIDCard:(NSString *)IDCard {
    
    
    @try
    {
        
        if ([LMStringUtil isEmptyStringWith:IDCard]) {
            return NO;
        }
        
        
        NSString *number = [IDCard uppercaseString];
        //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。
        if (![self checkValidWithRegex:@"^(\\d{14}|\\d{17})(\\d|[X])$" string:number]) {
            return NO;
        }
        
        
        //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
        //下面分别分析出生日期和校验位
        NSInteger len = 0;
        len = [number length];
        
        
        // 检测15位身份证IDCard
        if (len == 15)
        {
            //NSString * regexString = @"^(\\d{6})(\\d{2})(\\d{2})(\\d{2})(\\d{3})$";
            NSString * split1 = [number substringWithRange:NSMakeRange(0, 6)];
            NSString * split2 = [number substringWithRange:NSMakeRange(6, 2)];
            NSString * split3 = [number substringWithRange:NSMakeRange(8, 2)];
            NSString * split4 = [number substringWithRange:NSMakeRange(10, 2)];
            NSString * split5 = [number substringWithRange:NSMakeRange(12, 3)];
            
            NSLog(@"%@ %@ %@ %@ %@", split1, split2, split3, split4, split5);
            
            /*
             // 检查生日日期是否正确
             NSDate * birthDate = [self convertDateFromString:[NSString stringWithFormat:@"19%@%@%@", split2, split3, split4]];
             
             NSDateComponents * components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:birthDate];
             NSInteger year = [components year];
             NSInteger month = [components month];
             NSInteger day = [components day];
             */
            
            NSInteger year = [[NSString stringWithFormat:@"19%@", split2] integerValue];
            NSInteger month = [split3 integerValue];
            NSInteger day = [split4 integerValue];
            
            
            if (year == [[NSString stringWithFormat:@"19%@", split2] integerValue] && month == [split3 integerValue] && day == [split4 integerValue])
            {
                // 将15位身份证转成18位
                // 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
                int arrInt[17] = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
                NSArray *arrCh = @[@"1", @"0", @"X", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
                NSInteger nTemp = 0;
                
                //num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
                number = [NSString stringWithFormat:@"%@19%@", split1, [number substringWithRange:NSMakeRange(6, [number length] - 6)]];
                
                for(NSInteger i = 0; i < 17; i ++)
                {
                    nTemp += [[number substringWithRange:NSMakeRange(i, 1)] integerValue] * arrInt[i];
                }
                
                number = [NSString stringWithFormat:@"%@%@", number, [arrCh objectAtIndex:nTemp % 11]];
                NSLog(@"15转18位身份证： %@", number);
                
            } else {
                
                NSLog(@"输入的身份证号里出生日期不对！");
                return NO;
            }
        }
        
        
        // 检测18位身份证IDCard
        len = [number length];
        if (len == 18)
        {
            //NSString * regexString = @"^(\\d{6})(\\d{4})(\\d{2})(\\d{2})(\\d{3})(\\d|[X])$";
            NSString * split1 = [number substringWithRange:NSMakeRange(0, 6)];
            NSString * split2 = [number substringWithRange:NSMakeRange(6, 4)];
            NSString * split3 = [number substringWithRange:NSMakeRange(10, 2)];
            NSString * split4 = [number substringWithRange:NSMakeRange(12, 2)];
            NSString * split5 = [number substringWithRange:NSMakeRange(14, 3)];
            NSString * split6 = [number substringWithRange:NSMakeRange(17, 1)];
            
            NSLog(@"%@ %@ %@ %@ %@ %@", split1, split2, split3, split4, split5, split6);
            
            /*
             // 检查生日日期是否正确
             NSDate * birthDate = [self convertDateFromString:[NSString stringWithFormat:@"%@%@%@", split2, split3, split4]];
             
             NSDateComponents * components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:birthDate];
             
             NSInteger year = [components year];
             NSInteger month = [components month];
             NSInteger day = [components day];
             */
            
            NSInteger year = [split2 integerValue];
            NSInteger month = [split3 integerValue];
            NSInteger day = [split4 integerValue];
            if (year == [split2 integerValue] && month == [split3 integerValue] && day == [split4 integerValue])
            {
                // 检验18位身份证的校验码是否正确。
                // 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
                NSString * valnum;
                int arrInt[17] = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
                NSArray * arrCh = @[@"1", @"0", @"X", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
                
                NSInteger nTemp = 0;
                for(NSInteger i = 0; i < 17; i ++)
                {
                    //nTemp += num.substr(i, 1) * arrInt[i];
                    nTemp += [[number substringWithRange:NSMakeRange(i, 1)] integerValue] * arrInt[i];
                }
                
                valnum = [arrCh objectAtIndex:nTemp % 11];
                if (![valnum isEqualToString:split6])
                {
                    NSLog(@"18位身份证的校验码不正确！应该为：%@", valnum);
                    return NO;
                }
                
                return YES;
                
            } else {
                
                NSLog(@"输入的身份证号里出生日期不对！");
                return NO;
            }
            
            return NO;
        }
        
    }
    @catch (NSException * exception) {
        
        NSLog(@"%@ %@", [exception name], [exception reason]);
        
    }@finally {}
    
    
    return NO;
    
}



#pragma mark 正则表达式验证
+ (BOOL)checkValidWithRegex:(NSString *)regex string:(NSString *)string
{
    NSPredicate * regexString = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regexString evaluateWithObject:string];
}



#pragma mark 判断字符串内容是否为整形
+ (BOOL)isPureIntWith:(NSString *)intString {
    
    NSScanner * scan = [NSScanner scannerWithString:intString];
    
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}



#pragma mark 判断字符串内容是否为浮点形
+ (BOOL)isPureFloatWith:(NSString *)floatString {
    
    NSScanner * scan = [NSScanner scannerWithString:floatString];
    
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}



#pragma mark 四舍五入
+ (NSString *)decimalwithFormat:(NSString *)format  floatV:(float)floatV {
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}



#pragma mark 格式化所有带标签的文本
+(NSString *)stringFromfilterHTML:(NSString *)html {
    
    html = [[[html stringByReplacingOccurrencesOfString:@"</p><h5>" withString:@"\n\n"] stringByReplacingOccurrencesOfString:@"</p><p>" withString:@"\n"] stringByReplacingOccurrencesOfString:@"</h5><p>" withString:@"\n"];
    
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    
    while([scanner isAtEnd]== NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }

    return html;
}



#pragma mark  查看字符串中是否包含字符串
+ (BOOL)isContainString:(NSString *)aString withSuperString:(NSString *)superString {
    
    BOOL iOS8OrLater = [[[UIDevice currentDevice] systemVersion] floatValue] >= 8;
    
    if (iOS8OrLater) {
        
        return [superString containsString:aString];
        
    } else {
        
        NSRange range = [superString rangeOfString:aString];
        if(range.length > 0) {
            return YES;
        }
        return NO;
        
    }
}



#pragma mark 去除字符串中的空格
+ (NSString *)removeSpacesFromString:(NSString *)superString {
    return [superString stringByReplacingOccurrencesOfString:@" " withString:@""];
}



#pragma mark  对手机号码做特殊处理（例如158********）
+ (NSString *)specialTreatmentPhoneNumberWith:(NSString *)numberString {
    
    if ([numberString length] != 0) {
        
        NSInteger characterCount = [numberString length];
        if (characterCount <= 4) {
            return numberString;
        }
        
        return [numberString stringByReplacingCharactersInRange:NSMakeRange((characterCount-4)/2, 4) withString:@"****"];
    }
    
    return nil;
}



#pragma mark 计算文本的大小CGSize
+ (CGSize)calculateTextSizeWithText:(NSString *)stretxt TextFont:(UIFont *)textFont constrainedToSize:(CGSize)constrainedMaxSize lineBreakMode:(NSLineBreakMode)lineBreakMode textAlignment:(NSTextAlignment)textAlignment {
    
    CGSize textSize;
    if (!textFont){
        textFont = [UIFont systemFontOfSize:14];  // 默认字体大小是14
    }
    
    // 计算文本的高度
    if ([stretxt respondsToSelector:@selector(sizeWithFont:constrainedToSize:lineBreakMode:)]){ // 这方法只在ios7中有用，ios7之后被废弃了
        
        textSize = [stretxt sizeWithFont:textFont constrainedToSize:constrainedMaxSize lineBreakMode:lineBreakMode];
        
    } else if ([stretxt respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        
        
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = lineBreakMode;
        paragraphStyle.alignment = textAlignment;
        NSDictionary * attributes = @{NSFontAttributeName :textFont,
                                      NSParagraphStyleAttributeName : paragraphStyle};
        // options为默认的
        textSize = [stretxt boundingRectWithSize:constrainedMaxSize
                                               options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                            attributes:attributes
                                               context:nil].size;
    }
    
    return textSize;
}



@end
