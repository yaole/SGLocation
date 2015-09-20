# SGLocation

    一行代码获取当前城市
    [loc setGetCity:^(NSString *city) {
        NSLog(@"%@",city);
    }];
    
    一行代码获取当前位置
    [loc setGetLocation:^(NSString *location) {
        NSLog(@"%@",location);
    }];
    
    一行代码获取当前坐标
    [loc setGetCoordinate:^(CLLocationCoordinate2D coodinate) {
        NSLog(@"%f-%f",coodinate.latitude,coodinate.longitude);
    }];
