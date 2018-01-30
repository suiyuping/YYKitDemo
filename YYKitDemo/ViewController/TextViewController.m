//
//  TextViewController.m
//  YYKitDemo
//
//  Created by suiyuping on 2018/1/29.
//  Copyright © 2018年 suiyuping. All rights reserved.
//

#import "TextViewController.h"
#import "YYText.h"
#define Daoxiang @"\n周杰伦-稻香\n\n词/曲:周杰伦\n对这个世界如果你有太多的抱怨\n跌倒了 就不敢继续往前走\n为什么 人要这么的脆弱 堕落\n请你打开电视看看 多少人\n为生命在努力勇敢的走下去\n我们是不是该知足\n珍惜一切就算没有拥有\n\n还记得你说家是唯一的城堡\n随着稻香河流继续奔跑\n微微笑 小时候的梦我知道\n不要哭让萤火虫带着你逃跑\n乡间的歌谣永远的依靠\n童年的纸飞机 现在终于飞回我手里\n\n所谓的那快乐 赤脚在田里追蜻蜓追到累了\n偷摘水果被蜜蜂给叮到怕了\n谁在偷笑呢\n我靠着稻草人吹着风唱着歌睡着了\n哦 哦 午后吉他在虫鸣中更清脆\n哦 哦 阳光洒在路上就不怕心碎\n珍惜一起 就算没有拥有\n"

@interface TextViewController ()
@property (nonatomic,strong)UIScrollView * scrollView;
@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"YYText";
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-44)];
    self.scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*3);
    self.scrollView.pagingEnabled = NO;
    NSMutableAttributedString * text = [[NSMutableAttributedString alloc] initWithString:Daoxiang];
    [text yy_setFont:[UIFont systemFontOfSize:14] range:text.yy_rangeOfAll];//字体
    text.yy_lineSpacing = 10;//行间距
    
    /*字体、颜色、文字间距*/
    NSRange range0 = [[text string] rangeOfString:@"对这个世界如果你有太多的抱怨" options:NSCaseInsensitiveSearch];
    //字体
    [text yy_setFont:[UIFont systemFontOfSize:25] range:range0];
    //文字颜色
    [text yy_setColor:[UIColor purpleColor] range:range0];
    //文字间距
    [text yy_setKern:@(2) range:range0];
    /*文字描边(空心字)*/
    NSRange range1 = [[text string] rangeOfString:@"跌倒了 就不敢继续往前走" options:NSCaseInsensitiveSearch];
    //文字描边(空心字)默认黑色，必须设置width
    [text yy_setStrokeColor:[UIColor orangeColor] range:range1];
    [text yy_setStrokeWidth:@(2) range:range1];
    
    /*删除样式、下划线*/
    NSRange range2 = [[text string] rangeOfString:@"为什么 人要这么的脆弱 堕落" options:NSCaseInsensitiveSearch];
    YYTextDecoration * decoration = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle width:@(1) color:[UIColor blueColor]];
    //删除样式
    [text yy_setTextStrikethrough:decoration range:range2];
    //下划线
    [text yy_setTextUnderline:decoration range:range2];
    /*边框*/
    NSRange range3 = [[text string] rangeOfString:@"请你打开电视看看 多少人" options:NSCaseInsensitiveSearch];
    //边框
    YYTextBorder * border = [YYTextBorder new];
    border.strokeColor = [UIColor colorWithRed:1.000 green:0.029 blue:0.651 alpha:1.000];
    border.strokeWidth = 3;
    border.lineStyle = YYTextLineStylePatternCircleDot;
    border.cornerRadius = 3;
    border.insets = UIEdgeInsetsMake(0, -2, 0, -2);
    [text yy_setTextBorder:border range:range3];
    /*阴影*/
    NSRange range4 = [[text string] rangeOfString:@"为生命在努力勇敢的走下去" options:NSCaseInsensitiveSearch];
    //阴影
    NSShadow * shadow1 = [[NSShadow alloc] init];
    [shadow1 setShadowColor:[UIColor redColor]];
    [shadow1 setShadowBlurRadius:1.0];
    [shadow1 setShadowOffset:CGSizeMake(2, 2)];
    [text yy_setShadow:shadow1 range:range4];
    /*文体内阴影*/
    NSRange range5 = [[text string] rangeOfString:@"我们是不是该知足" options:NSCaseInsensitiveSearch];
    YYTextShadow * shadow2 = [YYTextShadow new];
    shadow2.color = [UIColor redColor];
    shadow2.offset = CGSizeMake(0, 2);
    shadow2.radius = 1;
    [text yy_setTextInnerShadow:shadow2 range:range5];
    /*多重阴影*/
    NSRange range6 = [[text string] rangeOfString:@"珍惜一切就算没有拥有" options:NSCaseInsensitiveSearch];
    YYTextShadow * shadow3 = [YYTextShadow new];
    shadow3.color = [UIColor redColor];
    shadow3.offset = CGSizeMake(0, -1);
    shadow3.radius = 1.5;
    YYTextShadow * subShadow = [YYTextShadow new];
    subShadow.color = [UIColor greenColor];
    subShadow.offset = CGSizeMake(0, 1);
    subShadow.radius = 1.5;
    shadow3.subShadow = subShadow;
    [text yy_setTextShadow:shadow3 range:range6];
    YYTextShadow * shadow4 = [YYTextShadow new];
    shadow4.color = [UIColor orangeColor];
    shadow4.offset = CGSizeMake(0, 2);
    shadow4.radius = 1;
    [text yy_setTextInnerShadow:shadow4 range:range6];
    /*简单文本高亮*/
    NSRange range7 = [[text string] rangeOfString:@"随着稻香河流继续奔跑" options:NSCaseInsensitiveSearch];
    [text yy_setTextHighlightRange:range7 color:[UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000] backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220] tapAction:^(UIView * containerView,NSAttributedString * text,NSRange range,CGRect rect){
    }];
    //文本高亮pro
    UIColor * colorNormal = [UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000];
    UIColor * colorHighlight = [UIColor purpleColor];
    NSRange range8 = [[text string] rangeOfString:@"微微笑 小时候的梦我知道" options:NSCaseInsensitiveSearch];
    YYTextDecoration * decorationNormal = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle width:@(1) color:colorNormal];
    YYTextDecoration * decorationHighlight = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle width:@(1) color:colorHighlight];
    //未点击时颜色
    [text yy_setColor:colorNormal range:range8];
    //未点击时下划线
    [text yy_setTextUnderline:decorationNormal range:range8];
    //点击后的状态
    YYTextHighlight * highlight = [YYTextHighlight new];
    [highlight setColor:colorHighlight];
    [highlight setUnderline:decorationHighlight];
    highlight.tapAction = ^(UIView * containerView,NSAttributedString * text,NSRange range,CGRect rect){
        
    };
    [text yy_setTextHighlight:highlight range:range8];
    YYTextView * textView = [YYTextView new];
    textView.frame = CGRectMake(10, 0, self.view.frame.size.width-20, self.view.frame.size.height-44);
    textView.attributedText = text;
    [self.scrollView addSubview:textView];
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
