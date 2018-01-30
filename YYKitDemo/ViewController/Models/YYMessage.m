//
//  YYMessage.m
//  YYKitDemo
//
//  Created by suiyuping on 2018/1/29.
//  Copyright © 2018年 suiyuping. All rights reserved.
//

#import "YYMessage.h"

@implementation YYMessage
/*
 *1.该方法是'字典里的属性Key'和'要转化为模型里的属性名'不一样 而重写的
 *前：模型的属性       后：字典里的属性
 */
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"messageId":@"i",
             @"content":@"c",
             @"time":@"t"};
}

/*!
 *  2. 下面的两个方法 `字典里值`与`模型的值`类型不一样`需要转换`而重写的方法
 *   NSDate *time     dic[@"t"]是double类型的的秒数
 */

/// Dic -> model
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    self.time = (NSDate *)[NSDate dateWithTimeIntervalSince1970:[dic[@"t"] doubleValue]/1000];
    
    return YES;
}

/// model -> Dic
- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
    
    dic[@"t"] = @([self.time timeIntervalSince1970] * 1000).description;
    
    return YES;
}
@end
