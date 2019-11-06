# flutter_toast
超级简单的 flutter toast 实现

## 使用

#### 默认 
>背景颜色: 黑色, 背景透明度: 0.7, 文字颜色: 白色, 文字大小: 14, 显示时长 2000(毫秒)

```dart
Toast.show(context, '信息');
```

#### 自定义
> bgColor: 背景颜色, textColor: 文字颜色, textSize: 文字大小, duration: 显示时长(毫秒)

```dart
Toast.show(context, "信息", bgColor: Colors.white, textColor: Colors.black, textSize: 14, duration: 3);
```

#### 手动隐藏

```dart
Toast.dismiss();
```

