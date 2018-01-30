//
//  YYRepo.h
//  YYKitDemo
//
//  Created by suiyuping on 2018/1/29.
//  Copyright © 2018年 suiyuping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYUser.h"
@interface YYRepo : NSObject

@property (nonatomic,assign)uint64_t rid;
@property (nonatomic,copy)NSString * name;
@property (nonatomic,strong)NSDate * createTime;
@property (nonatomic,strong)YYUser * owner;

@end
