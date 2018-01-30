//
//  YYMessage.h
//  YYKitDemo
//
//  Created by suiyuping on 2018/1/29.
//  Copyright © 2018年 suiyuping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYMessage : NSObject

@property (nonatomic,assign)uint64_t messageId;
@property (nonatomic,strong)NSString * content;
@property (nonatomic,strong)NSDate * time;

@end
