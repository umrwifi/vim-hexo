## Quick Start

### Install

如果使用Vundle，在.vimrc 文件里面增加:
``` vim
Plugin 'eaglelzy/vim-hexo'
```

在vim里面执行

``` vim
:VundleInstall
```

在.vimrc 配置文件中加入hexo的根目录，比如hexo位于/home/lizy/hexo中，则添加

``` vim
let g:hexoRootPath="/home/lizy/hexo"
```

### Ho to Use
``` vim
:HexoNew <title>        hexo new <title>
:HexoNewDraft <title>   hexo new draft <title>
:HexoOpen               打开hexo的post目录
:HexoOpenDraft          打开hexo的draft目录
:HexoC                  hexo clean
:HexoG                  hexo clean && hexo g
:HexoD                  hexo clean && hexo g && hexo d
```

可以在.vimrc 增加快捷键，比如：
``` vim
nnoremap <leader>ww :HexoOpen<CR>
nnoremap <leader>wr :HexoOpenDraft<CR>
nnoremap <leader>wc :HexoC<CR>
nnoremap <leader>wg :HexoG<CR>
nnoremap <leader>wd :HexoD<CR>
```
