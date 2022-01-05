" =============================================================================
" 支持ssh远程操作vim，输入法自动切换插件
" normal模式切英文，insert模式自动切换到上次的输入法
" 需要服务端支持才可以使用。
" Author:       lxyoucan <itkey20@gmail.com>
" Last Change:  2022-01-05
" Version:      1.0.0
" 灵感源于:     https://github.com/ybian/smartim
" License:      MIT
" =============================================================================
if exists('g:sshim_loaded') || &cp
  finish
endif
let g:sshim_loaded = 1

if !exists("g:sshim_disable")
  let g:sshim_disable = 0
endif
"如果没有设置服务器端地址，则禁用插件
if !exists("g:sshim_url")
  let g:sshim_disable = 1
endif


"处理离开insert模式的事件
function! SshIMInsertLeave()
	if g:sshim_disable == 1
    	return
  	endif
	silent exec "!(curl ".g:sshim_url."/insertLeave > /dev/null 2>&1) &"
endfunction
"处理进入insert模式的事件
function! SshIMInsertEnter()
	if g:sshim_disable == 1
    	return
  	endif
	silent exec "!(curl ".g:sshim_url."/insertEnter > /dev/null 2>&1) &"
endfunction
"绑定事情处理函数
autocmd InsertLeave * call SshIMInsertLeave() 
autocmd InsertEnter * call SshIMInsertEnter() 



