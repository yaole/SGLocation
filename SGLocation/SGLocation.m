//
//  SGLocation.m
//  SGLocation
//
//  Created by yyx on 15/9/20.
//  Copyright (c) 2015年 yyx. All rights reserved.
//

#import "SGLocation.h"

@interface SGLocation()<CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager *manager;

@end

@implementation SGLocation

static SGLocation *_instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)shareLocation{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (CLLocationManager *)manager{
    if (_manager == nil) {
        _manager = [[CLLocationManager alloc] init];
        _manager.delegate = self;
        [_manager requestWhenInUseAuthorization];
    }
    return _manager;
}
- (void)setGetCity:(void (^)(NSString *))getCity{
    _getCity = getCity;
    [self.manager startUpdatingLocation];
}
- (void)setGetCoordinate:(void (^)(CLLocationCoordinate2D))getCoordinate{
    _getCoordinate = getCoordinate;
    [self.manager startUpdatingLocation];
}
- (void)setGetLocation:(void (^)(NSString *))getLocation{
    _getLocation = getLocation;
    [self.manager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *loc =[locations lastObject];

    //反地理编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count) {
            //获取当前城市
            CLPlacemark *mark = placemarks.firstObject;
            NSDictionary *dict = [mark addressDictionary];
            NSString *city = [dict objectForKey:@"State"];
            //城市
            if (self.getCity) {
                self.getCity(city);
                [self.manager stopUpdatingLocation];
            }
            
            //坐标
            if(self.getCoordinate){
                self.getCoordinate(mark.location.coordinate);
                [self.manager stopUpdatingLocation];
            }
           
            //位置信息
            if (self.getLocation) {
                self.getLocation(mark.name);
                [self.manager stopUpdatingLocation];
            }
        }
    }];
}

@end
