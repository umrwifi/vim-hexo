" ============================================================================
" File:        hexo.vim
" Description: 这是一个跟hexo配合的插件
" Maintainer:  
" ============================================================================
if ( !exists('g:hexoRootPath') )
    echom "plugin vim-hexo error! please add g:hexoRootPath in .vimrc~~"
    fini
endif

"let g:hexoRootPath="/home/lizy/hexo/"
let g:hexoPostPath=g:hexoRootPath . "source/_posts/"

fun! OpenHexoRootPath()
    execute "cd " . g:hexoRootPath
endfun

fun! OpenHexoPostPath()
    execute "cd " . g:hexoPostPath
endfun

fun! OpenHexoPostPathAndNERDTree()
    call OpenHexoPostPath()
    if exists(':NERDTree')
        execute 'NERDTree'
    endif
endfun

fun! OpenHexoPostFile(...)
    call OpenHexoPostPath()

    execute "e " . a:1 . ".md"
endfun

fun! NewHexoPost(...)
    if(!executable('hexo'))
        echom 'no hexo found!'
        return
    endif

    let filename = GenerateFileName(a:1)

    execute "!hexo new " . filename 

    call OpenHexoPostFile(filename)
endfun

fun! GenerateFileName(...)
    call OpenHexoPostPath()

    let fileList = split(globpath(".", a:1 . "*.md"), "\n")

    let max = 0
    for name in fileList
        let filenames = split(fnamemodify(name, ":t:r"), "-")
        if (len(filenames) == 2)
            if (filenames[0] != a:1)
                continue
            endif
            let index = filenames[1] + 0
            if (max < index)
                let max = index
            endif
        endif
    endfor

    return max == 0 ? a:1 : a:1 . "-" . (max + 1)
endfun



fun! HexoC()
    if(executable('hexo'))
        call OpenHexoRootPath()
        execute "!hexo clean"
    elseif
        echom 'no hexo found!'
    endif
endfun

fun! HexoG()
    if(executable('hexo'))
        call OpenHexoRootPath()
        execute "!hexo g"
    elseif
        echom 'no hexo found!'
    endif
endfun

fun! HexoD()
    if(executable('hexo'))
        call OpenHexoRootPath()
        execute "!hexo d"
    elseif
        echom 'no hexo found!'
    endif
endfun

fun! HexoCGD()
    if(executable('hexo'))
        call OpenHexoRootPath()
        execute "!hexo clean"
        execute "!hexo g"
        execute "!hexo d"
    elseif
        echom 'no hexo found!'
    endif
endfun

command! HexoOpen :call OpenHexoPostPathAndNERDTree()
command! HexoC :call HexoC()
command! HexoG :call HexoG()
command! HexoD :call HexoD()
command! HexoCGD :call HexoCGD()
command! -nargs=+ HexoNew :call NewHexoPost("<args>")
