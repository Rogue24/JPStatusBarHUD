# JPStatusBarHUD
简陋的状态栏指示器

## 显示自定义文本
```objc
[JPStatusBarHUD showMessage:@"哈哈"];
```

## 显示自定义图文 
```objc
[JPStatusBarHUD showMessage:@"曹操" image:[UIImage imageNamed:@"star"]];
```

## 显示成功信息 
```objc
[JPStatusBarHUD showSuccess:@"加载成功"];
```

## 显示错误信息 
```objc
[JPStatusBarHUD showError:@"加载失败"];
```

## 显示加载信息 
```objc
[JPStatusBarHUD showLoading:@"正在加载中..."];
```

## 隐藏HUD 
```objc
[JPStatusBarHUD hide];
```

## 陆续更新
    ......