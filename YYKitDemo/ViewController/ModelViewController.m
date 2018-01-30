//
//  ModelViewController.m
//  YYKitDemo
//
//  Created by suiyuping on 2018/1/29.
//  Copyright © 2018年 suiyuping. All rights reserved.
//

#import "ModelViewController.h"
#import "YYBook.h"
#import "YYUser.h"
#import "YYRepo.h"
#import "YYPhoto.h"
#import "YYAlbum.h"
#import "YYMessage.h"
#import "YYModel.h"
@interface ModelViewController ()

@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YYModel";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i< 5; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(40, 80+i*80, self.view.frame.size.width-80, 20);
        button.tag = i;
//        [button setTitle:@"1.JSON转字符串" forState:UIControlStateNormal];
        if (i == 0) {
            [button setTitle:@"1.JSON转字符串" forState:UIControlStateNormal];
        }else if (i == 1){
            [button setTitle:@"2.普通字典转模型" forState:UIControlStateNormal];
        }else if (i == 2){
            [button setTitle:@"3.属性里有自定义的模型" forState:UIControlStateNormal];
        }else if (i == 3){
            [button setTitle:@"4.属性里有数组、字典、集合" forState:UIControlStateNormal];
        }else if (i == 4){
           [button setTitle:@"5.字典里的属性名与对象的属性名不一致" forState:UIControlStateNormal];
        }
        [button addTarget:self action:@selector(ClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}
- (void)ClickAction:(UIButton *)sender{
    switch (sender.tag) {
        case 0:{
            /*JSON转字符串*/
            //JSON -> 模型 (json->字典->模型)
            YYBook * book = [YYBook yy_modelWithJSON:@"     \
                             {                                           \
                             \"name\": \"Harry Potter\",              \
                             \"pages\": 512,                          \
                             \"publishDate\": \"2010-01-01\"          \
                             }"];
            NSString * bookJSON = [book yy_modelToJSONString];
            NSLog(@"Book:%@",bookJSON);
        }
            break;
        case 1:{
            /*焦点模型:YYBook(解释:普通字典转模型)*/
            NSDictionary * dict = @{
                                    @"name":@"Harry Potter",
                                    @"pages":@(512),
                                    @"publishDate":@"2010-01-01"
                                    };
            YYBook * book1 = [YYBook yy_modelWithDictionary:dict];
            NSString * bookJSON1 = [book1 yy_modelToJSONString];
            NSLog(@"bookJSON:%@",bookJSON1);
        }
            break;
        case 2:{
            /*焦点模型:YYRepo(解释:属性有自定义模型YYUser)*/
            NSDictionary * dict = @{@"rid":@(123456789),@"name":@"YYKit",@"createTime":@"2011-06-09T06:24:26Z",@"owner":@{@"uid":@(989898),@"name":@"mawenxing"}};
            YYRepo * repo1 = [YYRepo yy_modelWithDictionary:dict];
            NSLog(@"Repo1:%@\nowner.name=%@",repo1.name,repo1.owner.name);
        }
            break;
        case 3:{
            /*焦点模型:YYMessage(解释:字典里的属性名与对象的属性名不一致，手动修改)*/
            //第一种:字典版
            NSDictionary *dic = @{@"i":@2000000001,
                                  @"c":@"Hello",
                                  @"t":@1437237598000};
            
            YYMessage *message = [YYMessage yy_modelWithDictionary:dic];
            NSString * messageJSON = [message yy_modelToJSONString];
            NSLog(@"messageJSON:%@",messageJSON);
        }
            break;
        case 4:{
            /*焦点模型:YYMessage(解释:字典里的属性名与对象的属性名不一致，手动修改)*/
            //第二种:JSON版
            YYMessage * message = [YYMessage yy_modelWithJSON:@"{\"i\":\"2000000001\",\"c\":\"Hello\",\"t\":\"1437237598000\"}"];
            NSString * messageJSON = [message yy_modelToJSONString];
            NSLog(@"messageJSON:%@",messageJSON);
        }
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
