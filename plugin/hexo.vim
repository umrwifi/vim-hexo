" ============================================================================
" File:        hexo.vim
" Description: 这是一个跟hexo配合的插件
" Maintainer:  
" ============================================================================
let g:hexoRootPath="/home/lizy/hexo/"
let g:hexoPostPath=g:hexoRootPath . "source/_posts/"

fun! OpenHexoRootPath()
    execute "cd " . g:hexoRootPath
endfun

fun! OpenHexoPostPath()
    execute "cd " . g:hexoPostPath
endfun

fun! OpenHexoPostPathAndNERDTree()
    call OpenHexoPostPath()
    execute "NERDTreeToggle"
endfun

fun! OpenHexoPostFile(...)
    call OpenHexoPostPath()

    execute "e " . a:1 . ".md"
endfun

fun! NewHexoPost(...)
    let filename = GenerateFileName(a:1)

    execute "!hexo new " . filename 

    call OpenHexoPostFile(filename)
endfun

fun! GenerateFileName(...)
    call OpenHexoPostPath()

    let fileList = split(globpath(".", a:1 . "*.md"), "\n")
    echo fileList

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

    echo max

    return max == 0 ? a:1 : a:1 . "-" . (max + 1)
endfun



fun! HexoC()
    call OpenHexoRootPath()
    execute "!hexo clean"
endfun

fun! HexoG()
    call OpenHexoRootPath()
    execute "!hexo g"
endfun

fun! HexoD()
    call OpenHexoRootPath()
    execute "!hexo d"
endfun

fun! HexoCGD()
    call OpenHexoRootPath()
    execute "!hexo clean"
    execute "!hexo g"
    execute "!hexo d"
endfun

command HexoOpen :call OpenHexoPostPathAndNERDTree()
command HexoC :call HexoC()
command HexoG :call HexoG()
command HexoD :call HexoD()
command HexoCGD :call HexoCGD()
command -nargs=+ HexoNew :call NewHexoPost("<args>")


