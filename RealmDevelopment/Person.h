//
//  Person.h
//  RealmDevelopment
//
//  Created by changchun on 2017/3/23.
//  Copyright © 2017年 changchun. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"

RLM_ARRAY_TYPE(Dog);
@interface Person : RLMObject

@property NSString * name;
@property RLMArray<Dog*><Dog> * dogArray;
@end
