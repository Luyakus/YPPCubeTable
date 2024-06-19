### YPPCube

解决复杂场景的真正大杀器

随着移动端应用越来越复杂, 会出现一些超级复杂的页面, 比如抖音的视频主界面, 直播间, 聊天室, 这些场景
承担着非常多的业务. 单个页面的代码量甚至超过了一些中小型应用, 如何将这些代码合理的组织, 做到并行
开发, 并行测试, 并行上线, 快速定位问题, 有效隔离腐坏代码, 是我们面临的挑战.

YPPCube 是专门为解决上述复杂页面面临的问题而出现的综合性解决方案, 解决了组件解构, 组件通信, 数据共享等
一系列问题. 使用它可以很轻松, 很快速的构建出高质量的复杂页面

YPPCube 内置三种容器, 当然你也可以自定义任意布局的容器

- 竖向布局容器: YPPVGroupCube
  ![](1.png)

- 横向布局容器: YPPHGroupCube
  ![](2.png)

- Z 向布局容器: YPPZGroupCube
  ![](3.png)

这些容器可以互相嵌套使用, 构建出任意的页面, 下面给出一个聊天室
的示例
聊天室一般可以分为几个区域

1. header, 显示房间信息, 还房间人员头像
2. 座位区, 显示在麦位的用户,
3. 聊天区, 一般分为作用两块, 左边是聊天区, 右边是挂件区
4. 底部输入框, 会有一些送礼, 输入框的等元素

我们简单规划后效果如下
![](4.png)

代码如下

1. 整体的竖向布局容器

```objc
- (void)setupCubes {
    [self.cubes addObjectsFromArray:@[
        [[LGHeaderCube alloc] initWithData:nil],
        [[LGSeatCube alloc] initWithData:nil],
        [[LGMiddleCube alloc] initWithData:nil],
        [[LGInputCube alloc] initWithData:nil]
    ]];
}
```

2. LGMiddleCube 是一个横向的容器, 他的布局代码如下

```objc
- (void)setupCubes {
    [self.cubes addObjectsFromArray:@[
        [[LGChatCube alloc] initWithData:nil],
        [[LGSiderCube alloc] initWithData:nil]
    ]];
}
```

可以看到, 通过容器, 我们可以将每个小业务的代码解耦分离, 这样就可以做到并行开发, 同时还可以根据服务器配置, 动态的改变页面

点击输入框后会弹出来一个输入页面
![](5.png)
这里我们玩了一个小把戏, 这个输入框不是我们点击的那个, 而是在另一个层级上画出来的.

聊天室页面一般会有多个层级, 比如有进房动画层, 礼物播放层, 还有输入面板层, 这里我们以输入面板层为例. 想要引入多个层级, 需要对最初的布局代码做一些更改, 我们把根布局由竖向布局改为 Z 向布局

```objc
- (void)setupCubes {
    [self.cubes addObjectsFromArray:@[
        [[LGComposeCube alloc] initWithData:nil],
        [[LGInputPresentCube alloc] initWithData:nil]
    ]];
}
```

点击假的输入框后会发送一条 message, 由输入面板层接收, 输入面板层接收后弹出键盘

```objc
// 假的输入框
- (void)inputClick {
    YPPEventMessage *m = [YPPEventMessage new];
    m.identifier = LGInputClickMessage;
    [LGEventBus.eventBus dispatchMessage:m];
}

// 输入面板
- (BOOL)canHandleMessage:(__kindof YPPEventMessage *)message {
    if ([message.identifier isEqualToString:LGInputClickMessage]) {
        return YES;
    }
    return NO;
}

- (void)handleMessage:(__kindof YPPEventMessage *)message {
    self.superView.hidden = NO;
    [self.input becomeFirstResponder];
}

```

所有子组件间的通信都可以通过这个 EventBus 来完成.
点击背景或者 Return, 键盘收起, 并发送 message, 由聊天区接收, 然后消息上屏

![](6.png)

```objc

// 聊天区接收消息, 并上屏
- (BOOL)canHandleMessage:(__kindof YPPEventMessage *)message {
    if ([message.identifier isEqualToString:LGInputReturnMessage]) {
        return YES;
    }
    return NO;
}

- (void)handleMessage:(__kindof YPPEventMessage *)message {
    [self.messages addObject:message.data];
    [self.tb reloadData];
}

```
通过这个小小的 demo, 相信大家已经感受到了 YPPCube 的方便与快捷.
YPPCube 是经过充分验证的企业级复杂页面的解决方案, 希望它能帮助大家构建高质量的应用
