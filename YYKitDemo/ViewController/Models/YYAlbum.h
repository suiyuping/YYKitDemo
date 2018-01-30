//
//  YYAlbum.h
//  ML_YYModel_Demo
//
//  Created by 马文星 on 16/5/21.
//  Copyright © 2016年 Demos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYAlbum : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *photos; // Array<YYPhoto>
@property (nonatomic, strong) NSDictionary *likedUsers; // Key:name(NSString) Value:user(YYUser)
@property (nonatomic, strong) NSSet *likedUserIds; // Set<NSNumber>
@end

