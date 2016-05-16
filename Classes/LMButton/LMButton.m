//
//  LMButton.m
//  LMCommonKit
//
//  Created by mengmenglu on 3/28/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMButton.h"
#import "UIImage+Extension.h"

@implementation LMButton

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 可以达到同一界面上多个控件接受事件时的排他性,从而避免一些问题。也就是说避免在一个界面上同时点击多个button
    [self setExclusiveTouch:YES];
    
}


- (void)drawRect:(CGRect)rect {
    
    if (self.underlineEnable) {
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGSize fontSize = CGSizeZero;
        
        CGSize maximumLabelSize = self.bounds.size;
        
        NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine |
        NSStringDrawingUsesLineFragmentOrigin;
        
        NSDictionary * attributes = @{NSFontAttributeName:self.titleLabel.font};
        CGRect titleLabelBounds = [self.titleLabel.text boundingRectWithSize:maximumLabelSize
                                                                     options:options
                                                                  attributes:attributes
                                                                     context:nil];
        
        fontSize = titleLabelBounds.size;
        const CGFloat * colors = CGColorGetComponents(self.titleLabel.textColor.CGColor);
        CGContextSetRGBStrokeColor(ctx, colors[0], colors[1], colors[2], 1.0f); // Format : RGBA
        
        CGContextSetLineWidth(ctx, 1.0f);
        float fontLeft = floorf(self.titleLabel.center.x - fontSize.width / 2.0);
        float fontRight = floorf(self.titleLabel.center.x + fontSize.width / 2.0);
        
        CGContextMoveToPoint(ctx, fontLeft, self.bounds.size.height - 1);
        CGContextAddLineToPoint(ctx, fontRight, self.bounds.size.height - 1);
        CGContextStrokePath(ctx);
    }
    
    [super drawRect:rect];
    
}


#pragma mark - Private Method
- (void)configureButton
{
    if (self.normalColor) { // 正常状态
        [self setBackgroundImage:[UIImage imageWithColor:self.normalColor cornerRadius:self.cornerRadius] forState:UIControlStateNormal];
    }
    
    if (self.highlightColor) {  // 高亮状态
        [self setBackgroundImage:[UIImage imageWithColor:self.highlightColor cornerRadius:self.cornerRadius] forState:UIControlStateHighlighted];
    }
    
    if (self.disabledColor) {  // 不可点击状态
        [self setBackgroundImage:[UIImage imageWithColor:self.disabledColor cornerRadius:self.cornerRadius] forState:UIControlStateDisabled];
    }
    
    
    if (self.selectedColor) {  // 选中状态
        [self setBackgroundImage:[UIImage imageWithColor:self.selectedColor cornerRadius:self.cornerRadius] forState:UIControlStateSelected];
    }
}


#pragma mark - Public Method
- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self configureButton];
}

- (void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    [self configureButton];
}

- (void)setHighlightColor:(UIColor *)highlightColor {
    _highlightColor = highlightColor;
    [self configureButton];
}


- (void)setDisabledColor:(UIColor *)disabledColor {
    _disabledColor = disabledColor;
    [self configureButton];
}

- (void)setSelectedColor:(UIColor *)selectedColor {
    _selectedColor = selectedColor;
    [self configureButton];
}

@end
