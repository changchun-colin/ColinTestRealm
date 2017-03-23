//
//  Post.h
//  RealmDevelopment
//
//  Created by changchun on 2017/3/23.
//  Copyright © 2017年 changchun. All rights reserved.
//

#import <Realm/Realm.h>
@class User;

RLM_ARRAY_TYPE(Post);

@interface Post : RLMObject

@property NSString              * identifier;  //主键
@property NSString              * title;         //标题
@property NSDate                * timeStamp;     //时间戳
@property NSData                * content;       //内容
@property NSInteger              scanNum;      //浏览量
@property RLMArray<Post*><Post> * commentArray;  //回帖数 一对多
@property NSNumber <RLMBool>    * isTop ;        //置顶
@property User * auther; //作者

@property NSInteger hot ;         //浏览量和回帖量相加

//不支持的类型  CGFLOAT, 请使用float，double
//常量在RLM数据库中是不可以为空的

@end
