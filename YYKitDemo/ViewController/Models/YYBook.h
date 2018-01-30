//
//  YYBook.h
//  YYKitDemo
//
//  Created by suiyuping on 2018/1/29.
//  Copyright © 2018年 suiyuping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYBook : NSObject

@property (nonatomic,copy)NSString * name;
@property (nonatomic,assign)uint64_t pages;
@property (nonatomic,strong)NSDate * publishDate;

@end
