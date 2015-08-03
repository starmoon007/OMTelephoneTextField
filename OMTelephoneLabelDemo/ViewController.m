//
//  ViewController.m
//  OMTelephoneLabelDemo
//
//  Created by Starmoon on 15/8/1.
//  Copyright (c) 2015年 macbook air. All rights reserved.
//

#import "ViewController.h"
#import "OMTelephoneTextField.h"
#import <CoreText/CoreText.h>


@interface ViewController ()

@property (weak, nonatomic) IBOutlet OMTelephoneTextField *telephone_textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.telephone_textField.userInteractionEnabled = YES;
    
    self.telephone_textField.font = [UIFont systemFontOfSize:14];
    
    
}


- (void)change{
//    NSLog(@"%@",self.telephone_textField.attributedText);
}





@end
