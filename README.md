# 说明

(neo)vim 配置，我用的是 _NeoVim_, _Mac_ 。

## 安装前需要的准备

1. **Homebrew** ，安装完最好换国内源，自行搜索方法

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

2. **Python3**

```bash
brew install python3
```

3. **pynvim**

```bash
pip3 install pynvim
```

4. 下载字体，[字体库][1]。选择自己喜欢的字体进行下载，我也备份了我所用的字体在 **fonts** 文件夹

5. **Iterm2** ，[下载地址][2]。然后选择上面你安装的字体。

6. 创建 `~/.config/nvim`文件夹，把 **init.vim** 放到改文件夹下。

7. **NeoVim**

```bash
brew install neovim
```

8. **Git**

```bash
brew install git
```

9. **Node**

```bash
brew install node
```

10. **oh-my-zsh**  + **Iterm2**，自行搜索方法

11. **ag** 是插件 ctrlsf.vim 需要的
```bash
brew install the_silver_searcher
```


# 安装

```bash
# 在命令行输入
nvim

# 在neovim 的普通模式
:PlugInstall
```

等待安装完成即可

[1]:[https://github.com/ryanoasis/nerd-fonts]
[2]:[https://iterm2.com]
