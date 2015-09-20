//
//  ViewController.m
//  SGLocation
//
//  Created by yyx on 15/9/20.
//  Copyright (c) 2015年 yyx. All rights reserved.
//

#import "ViewController.h"
#import "SGLocation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     SGLocation *loc = [SGLocation shareLocation];;
    
    [loc setGetCity:^(NSString *city) {
        NSLog(@"%@",city);
    }];
    
    [loc setGetLocation:^(NSString *location) {
        NSLog(@"%@",location);
    }];
    
    [loc setGetCoordinate:^(CLLocationCoordinate2D coodinate) {
        NSLog(@"%f-%f",coodinate.latitude,coodinate.longitude);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
