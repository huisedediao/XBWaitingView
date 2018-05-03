//
//  ViewController.m
//  XBWaitingView
//
//  Created by xxb on 2018/5/3.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "XBWaitingView.h"

@interface ViewController ()
@property (nonatomic,strong) XBWaitingView *v_waitting;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self showWaitting:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hiddenWaitting];
    });
}

- (void)showWaitting:(NSString *)msg
{
    if ([self.v_waitting isShowState])
    {
        return;
    }
    self.v_waitting = [[XBWaitingView alloc] initWithDisplayView:self.view];
    [self.v_waitting show];
}
- (void)hiddenWaitting
{
    if ([self.v_waitting isShowState] == NO)
    {
        return;
    }
    [self.v_waitting hidden];
    self.v_waitting = nil;
}


@end
