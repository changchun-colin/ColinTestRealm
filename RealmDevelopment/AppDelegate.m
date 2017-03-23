//
//  AppDelegate.m
//  RealmDevelopment
//
//  Created by changchun on 2017/3/20.
//  Copyright © 2017年 changchun. All rights reserved.
//

#import "AppDelegate.h"
#import "Realm.h"
#import "Post.h"

@interface AppDelegate ()

@property (nonatomic, strong) RLMRealm  * realm; /*!<<#注释#>*/
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    RLMRealm * rlm = [RLMRealm defaultRealm];
//    [Post allObjects];
//    //等同于
//    [Post allObjectsInRealm:rlm];
//    
//    
//    //自定义数据库
//    RLMRealmConfiguration * config = [RLMRealmConfiguration defaultConfiguration];
//    NSLog(@"%@",config);
//    
//    //修改 config.fileURL
//    config.fileURL  = [[NSBundle mainBundle]URLForResource:@"default" withExtension:@"realm"];
//    config.readOnly = YES; //只读
//    self.realm  = [RLMRealm realmWithConfiguration:config error:nil];
    
    
//    //内存数据库   如为弱引用，关闭程序会丢失
//    RLMRealmConfiguration * memoryC = [RLMRealmConfiguration defaultConfiguration];
//    memoryC.inMemoryIdentifier = @"memoryADatabase";
//    self.realm  = [RLMRealm realmWithConfiguration:memoryC error:nil];
    
    
    
//    //数据库写入通知
//    [self.realm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
////        [self updateUI];
//    }];
    
    
    
//    RLMResults * results = [Post allObjects];
//    [results addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
//        
//        if (!change) {
//            //第一次加载数据
////            [self.tableView reloadData];
//            return ;
//        }else{
//            //修改/新增 了内容
//            
//        }
//    }];
    
    
    //数据迁移 
    //内存数据库   如为弱引用，关闭程序会丢失
    
    
//    RLMRealmConfiguration * memoryC = [RLMRealmConfiguration defaultConfiguration];
//    memoryC.inMemoryIdentifier = @"memoryADatabase";
//    memoryC.schemaVersion  = 1;
//    [memoryC setMigrationBlock:^(RLMMigration *migration, uint64_t oldSchemaVersion){
//        if (oldSchemaVersion < 1) { //旧的版本库 ,进行迁移
//          [migration enumerateObjects:@"Post" block:^(RLMObject * _Nullable oldObject, RLMObject * _Nullable newObject) {
//              newObject[@"hot"] = @([oldObject[@"scanNum"]integerValue] + [oldObject[@"commentArray"]count]);
//          }];
//            
////           //属性重命名
////            [migration renamePropertyForClass:@"Post" oldName:@"title" newName:@"newTitle"];
//            
//        }
//        
//    }];
//    
//    self.realm  = [RLMRealm realmWithConfiguration:memoryC error:nil];
    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
