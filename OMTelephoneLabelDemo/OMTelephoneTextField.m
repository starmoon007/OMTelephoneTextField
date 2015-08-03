//
//  OMTelephoneTextField.m
//  OMTelephoneLabelDemo
//
//  Created by Starmoon on 15/8/1.
//  Copyright (c) 2015年 macbook air. All rights reserved.
//

#import "OMTelephoneTextField.h"
#import <CoreText/CoreText.h>

@interface OMTelephoneTextField ()

@property (copy, nonatomic) NSMutableAttributedString * mutaleAttarbutedString;

@end


@implementation OMTelephoneTextField



- (void)changeText{
    
    if (self.text.length > 11){
        NSMutableAttributedString *string =[[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
        [string deleteCharactersInRange:NSMakeRange(string.length - 1, 1)];
        self.attributedText = string;
        return;
    }
    
    
    NSUInteger targetCursorPosition =
    [self offsetFromPosition:self.beginningOfDocument
                       toPosition:self.selectedTextRange.start];
    
    if (self.text.length < 4 || self.text.length > 11 )return;
    
    NSMutableAttributedString *string =[[NSMutableAttributedString alloc]initWithString:self.text];
    long number = 10.0f;
    if (self.text.length >= 4){
        CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
        [string addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(2,1)];
        CFRelease(num);
    }
    
    if (self.text.length >= 8 ){
        CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
        [string addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(6,1)];
        CFRelease(num);
    }
    
    self.attributedText = string;
    
    if (self.attributedText.length >= targetCursorPosition){
        UITextPosition *targetPosition = [self positionFromPosition:[self beginningOfDocument]
                                                                  offset:targetCursorPosition];
        [self setSelectedTextRange:[self textRangeFromPosition:targetPosition
                                                             toPosition :targetPosition]];
    }
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addTarget:self action:@selector(changeText) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(changeText) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}




@end
