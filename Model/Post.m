//
//  Post.m
//  RealmDevelopment
//
//  Created by changchun on 2017/3/23.
//  Copyright © 2017年 changchun. All rights reserved.
//

#import "Post.h"


@implementation Post

//可空属性，决定属性是否可以为nil
+(NSArray<NSString *> *)requiredProperties{
    return @[@"title"];
}

//忽略属性
+(NSArray<NSString *> *)ignoredProperties{
    return @[];
}

//默认属性
+(NSDictionary *)defaultPropertyValues{
    return @{@"scanNum":@(0)};
}

//索引属性 支持NSString， NSNumber（包括常量），NSDate
+(NSArray<NSString *> *)indexedProperties{
    return @[@"title",@"timeStamp"];
}

//主键 唯一性
+(NSString *)primaryKey{
    return @"identifier";
}


@end
