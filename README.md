# DarwinTweaks
一些 macOS Tweaks

## 减少菜单栏图标间距

macOS Big Sur 对图形界面进行了大修改，同时（离谱地）增大了菜单栏图标的间距，对刘海屏非常不友好。

使用下面的命令还原小间距：

```shell
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 6
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 6
```

使用下面的命令回到默认间距：

```shell
defaults -currentHost delete -globalDomain NSStatusItemSelectionPadding
defaults -currentHost delete -globalDomain NSStatusItemSpacing
```

## 无延迟弹出 Dock 栏

默认状态下，自动隐藏的 Dock 栏在弹出时存在 0.5 秒的延迟。

可以通过下面命令取消弹出延迟：

```shell
defaults write com.apple.Dock autohide-delay -int 0 && killall Dock
```

## 使用手势拖动窗口

执行这条指令：

```shell
defaults write -g NSWindowShouldDragOnGesture -bool true
```

后，即可在同时按住 Control 和 Command 键时，拖动窗口任意位置来移动窗口。

## 使用 Touch ID 来授权 `sudo`

```shell
sudo sed -i ".bak" '2s/^/auth       sufficient     pam_tid.so\'$'\n/g' /etc/pam.d/sudo
```

后，即可使用 Touch ID 来授权 `sudo`。

> 这一变更在更新 macOS 系统后会失效。

## 禁用 LCD 字体平滑

这一功能本来可以在「系统偏好设置」—「通用」中配置，后来 Apple 将设置取消并将其设定为默认启用，但这在高分屏下的效果并不那么好。

可以通过下面指令关闭这一功能：

```shell
defaults -currentHost write -g AppleFontSmoothing -int 0
```

## 更多强调颜色

Apple 给 iMac (M1) 用户提供了额外的主题色选项，也可以用下面的开关手动打开：

```shell
defaults write -g NSColorSimulateHardwareAccent -bool YES

# 可选的索引包括 3 ~ 8
defaults write -g NSColorSimulatedHardwareEnclosureNumber -int 3
```

打开以上开关后，系统偏好设置的「强调颜色」项会增添额外的颜色选项（「这台 Mac」）。
