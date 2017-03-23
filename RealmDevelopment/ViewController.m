//
//  ViewController.m
//  RealmDevelopment
//
//  Created by changchun on 2017/3/20.
//  Copyright © 2017年 changchun. All rights reserved.
//

#import "ViewController.h"
#import "Realm.h"
#import "Dog.h"
#import "Person.h"

#import "Post.h"
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Post * post = [[Post alloc]initWithValue:@{@"title":@"shanghai"}];
    post.identifier = [[NSDate date] description];
    RLMRealm * rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
       //写入事物
        [rlm addObject:post];
    }];
    
//    //删除
//    [rlm transactionWithBlock:^{
//        [rlm deleteObject:post];
////        rlm deleteObjects:<#(nonnull id)#> //集合 批量删除数据
////        [rlm deleteAllObjects]          //全部删除
//    }];
    
    
    //修改
    
    //直接更新
    [rlm transactionWithBlock:^{
        post.timeStamp = [NSDate date];
        
    }];
    
    //查询
    RLMResults * results = [Post objectsWhere:@"title == %@",@"shanghai"];
    Post * postBeFound   = [results firstObject];
    
    [rlm transactionWithBlock:^{
        postBeFound.title           =  @"test for change";
//        NSLog(@"%@",postBeFound);
    }];
    
    //通过主键更新
    Post * postNew     = [[Post alloc]init];
    postNew.title      = @"newTitle";
    postNew.identifier = @"1";
    
    postNew.timeStamp = [NSDate date];
    
    [rlm transactionWithBlock:^{
        [rlm addOrUpdateObject:postNew];
    }];
    
    
    //批量修改
    RLMResults * allResults = [Post allObjects];
    [rlm transactionWithBlock:^{
       [allResults setValue:[NSDate date] forKey:@"timeStamp"];
    }];
    
    
    
    
    
    
    
//    [rlm beginWriteTransaction];
//    
//    [rlm  commitWriteTransaction];
    
    
    
    
    
    //综合查询
    //检索范围， 浏览量大于 100的帖子
    
//    RLMResults * postThatScanBiggerThan100 = [Post objectsWhere:@"scanNum > 100"];
    //检索范围 10到100的帖子
//    1. between 关键字
//    RLMResults * postBetween10To100 = [Post objectsWhere:@"scanNum >10 AND scanNum <100"];
//    RLMResults * postBetween10To100 = [Post objectsWhere:@"scanNum BETWEEN {10,100}"];
    
     //检索标题中含有test的帖子  [c]不区分大小写
//    RLMResults * PostThatHasTest = [Post objectsWhere:@"title CONTAINS [c] test"];
    
     //检索评论量大于10 且浏览量大于100的帖子 链式检索
//    RLMResults * result = [Post objectsWhere:@"commentArray.@count > 10"];
//    RLMResults * finalResult = [result objectsWhere:@"scanNum >100"];
//    
//    //结果排序  降序排列
////    [finalResult sortedResultsUsingProperty:@"timeStamp" ascending:NO];
//    [finalResult sortedResultsUsingKeyPath:@"timeStamp" ascending:NO];
//    //realm没有分页功能 惰性加载
//    NSLog(@"%@",finalResult);
    
    
    
    
    
}

-(void)test2{
    Post * post = [[Post alloc]initWithValue:@{@"title":@"lalala"}];
    User * user = [[User alloc]init];
    post.auther = user;
    
    RLMRealm * rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm addObject:post];
        [rlm addObject:user];
        NSLog(@"%@",post);
    }];

}

-(void)test1{
    //创建一个数据库，记录够够的名字和年龄
    Dog * dog = [[Dog alloc]init];
    dog.name = @"xiaoxiao";
    dog.age  = 10 ;
    
    //创建一个主人的记录
    Person * person1 = [[Person alloc]init];
    person1.name = @"lili";
    [person1.dogArray  addObject:dog];
    //    NSLog(@"%@",person1);
    //查询年龄小于3岁的狗狗
    //    RLMResults * results = [Dog objectsWhere:@"age == 10"];
    //    NSLog(@"%@",results);
    
    //添加狗狗  //查询结果是动态的
    RLMRealm  * rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        //        [rlm addObject:dog];    //写入到数据库
    }];
    
    //    NSLog(@"%@",results);
    
    //线程操作
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RLMRealm  * rlm = [RLMRealm defaultRealm];
        [rlm beginWriteTransaction];
        
        [rlm commitWriteTransaction];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
