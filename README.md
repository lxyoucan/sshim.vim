# 简介

SshIM 是一个解决ssh中使用vim/nvim 中文输入法自动切换插件。

原理：当ssh中使用的vim 进入insert模式或者离开insert模式，都会触发一个事件。当触发事件以后，通过http的方式通知我们的电脑，我们的电脑会自动切换英文输入法，或者切换中文输入法。

# 插件安装
  这里以packer为例,packer插件管理器安装方法:
修改`~/.config/nvim/lua/plugins.lua`文件，并增加如下内容：
```lua
 -- ssh远程vim自动切换本地输入法
 use "lxyoucan/sshim.vim"

```
`:wq`退出重新打开nvim后，执行`:PackerInstall` 安装。
# 配置

```vim
"服务器端地址，形如：http://localhost:8088 最后一个字符不要带/
let g:sshim_url = 'http://localhost:8088'
"0启用插件，1禁用插件,默认为0 
let g:sshim_disable = 1

```
当你使用宏的时候，或者出现短时间内频繁 insert 与normal模式切换的时候，可以通过`let g:sshim_disable = 1`来禁用输入法切换插件来提醒执行效率。

# 实现原理

- 从insert模式切换到normal模式插件会自动请求服务器的`/insertLeave`地址
- 从normal模式切换到insert模式插件会自动请求服务器的`/insertEnter`地址

服务器部署在你正在使用的电脑上面，这样你的电脑就能接收到当前的vim状态了，根据这个状态通过一些工具来切换本地的输入法即可。
# 灵感
https://github.com/ybian/smartim
