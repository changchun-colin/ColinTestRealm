//
//  User.h
//  RealmDevelopment
//
//  Created by changchun on 2017/3/23.
//  Copyright © 2017年 changchun. All rights reserved.
//

#import <Realm/Realm.h>
#import "Post.h"

@interface User : RLMObject

@property NSString     * nickName;
@property (readonly) RLMLinkingObjects*  postArray; //发布的帖子  一对多的关系

@end
