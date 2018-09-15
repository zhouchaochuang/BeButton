//
//  ViewController.m
//  Bebutton
//
//  Created by wallace on 2018/9/15.
//  Copyright © 2018年 wallace. All rights reserved.
//

#import "ViewController.h"
#import "BeButtonView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BeButtonView *timean = [[BeButtonView alloc]initWithFrame:CGRectMake(0, 80, 150, 150)];
    timean.center = CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height *0.5);
    [self.view addSubview:timean];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
