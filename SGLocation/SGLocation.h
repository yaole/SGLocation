//
//  SGLocation.h
//  SGLocation
//
//  Created by yyx on 15/9/20.
//  Copyright (c) 2015年 yyx. All rights reserved.
//


//1.在plist文件中添加以下两行
//NSLocationAlwaysUsageDescription
//NSLocationWhenInUseUsageDescription

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SGLocation : NSObject

+ (instancetype)shareLocation;

/** 获取城市 */
@property (nonatomic,copy) void (^getCity)(NSString *city);
/** 获取位置,包含街道 */
@property (nonatomic,copy) void (^getLocation)(NSString *location);
/** 获取经纬度 */
@property (nonatomic,copy) void (^getCoordinate)(CLLocationCoordinate2D Coordinate);

@end
