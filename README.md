# ScottCounter 简介
一款优雅地显示数字、金额动态变化的控件，支持UILabel和UIButton。

### 特点：
* 支持UILabel/UIButton数字加减动画显示；
* 支持设置一般文本属性以及富文本显示；
* 支持四种时间曲线函数动画；
* 支持自定义的数字格式；


# ScreenShot 效果图
![效果图](https://github.com/LZAscott/ScottCounter/blob/master/screenshot.gif)
# Requirements 要求
* Xcode 8+
* iOS 7.0+
* ARC / MRC

# How to use 如何使用
### 安装方式
* 手动安装：
`下载Demo后，将子文件夹ScottCounter拖入到项目中，导入头文件 ScottCounter.h 即可。`
        
* CocoaPods安装：

    
### 代码使用
#### UILabel
* 设置一般字体属性

```
[self.label1 scott_fromNumber:0 toNumber:100 duration:1.5f format:^NSString *(CGFloat number) {
        return [NSString stringWithFormat:@"%.2f", number];
    }];
```

* 设置富文本字体属性

```
[self.label2 scott_fromNumber:0 toNumber:100 duration:1.5f animationOptions:options attributedFormat:^NSAttributedString *(CGFloat number) {
        NSString *string = [NSString stringWithFormat:@"%.2f%%",number];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        // 设置字体属性
        NSRange range = [string rangeOfString:[NSString stringWithFormat:@"%.2f",number]];
        [attributedString addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:22],NSForegroundColorAttributeName:[UIColor brownColor]} range:range];
        return attributedString;
    } completion:^{
        self.label2.textColor = [UIColor redColor];
    }];
```

#### UIButton
* 设置一般字体属性

```
[self.btn1 scott_fromNumber:0 toNumber:100 duration:1.5f format:^NSString *(CGFloat number) {
        return [NSString stringWithFormat:@"%.2f", number];
    }];
```
* 设置富文本字体属性

```
[self.btn2 scott_fromNumber:0 toNumber:100 duration:1.5f animationOptions:options attributedFormat:^NSAttributedString *(CGFloat number) {
        NSString *string = [NSString stringWithFormat:@"%.2f%%",number];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        // 设置字体属性
        NSRange range = [string rangeOfString:[NSString stringWithFormat:@"%.2f",number]];
        [attributedString addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:22],NSForegroundColorAttributeName:[UIColor brownColor]} range:range];
        return attributedString;
    } completion:^{
        NSAttributedString *attr = [self.btn2 attributedTitleForState:UIControlStateNormal];
        NSMutableAttributedString *mAttri = [[NSMutableAttributedString alloc] initWithAttributedString:attr];
        NSRange range = NSMakeRange(0, attr.length);
        [mAttri addAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} range:range];
        [self.btn2 setAttributedTitle:(NSAttributedString *)mAttri forState:UIControlStateNormal];
    }];

```

**注意点：**
* 需要把UIButton设置自定义模式，不然会出现一闪一闪的效果;
* 如果在UIButton设置富文本标题之后，完成回调里面不能简单地使用`[self.btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];`来更改字体颜色；

# 联系
* 如果你发现有bug，欢迎提issue
* 如果你需要帮忙拓展，欢迎提issue
* 如果你想为代码做贡献，欢迎联系。





