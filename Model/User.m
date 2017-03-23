//
//  User.m
//  RealmDevelopment
//
//  Created by changchun on 2017/3/23.
//  Copyright © 2017年 changchun. All rights reserved.
//

#import "User.h"
#import "Post.h"
@implementation User

//反向关系
+(NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties{
    return  @{
              @"postArray" :[RLMPropertyDescriptor descriptorWithClass:[Post class] propertyName:@"auther"]
              
              };
}
@end
