vim9script

if exists("b:did_indent")
    finish
endif
b:did_indent = 1


function GoogleCppIndent()
    l:cline_num = line('.')

    l:orig_indent = cindent(l:cline_num)

    if l:orig_indent == 0 | return 0 | endif

    l:pline_num = prevnonblank(l:cline_num - 1)
    l:pline = getline(l:pline_num)
    if l:pline =~# '^\s*template' | return l:pline_indent | endif

    " TODO: I don't know to correct it:
    " namespace test {
    " void
    " ....<-- invalid cindent pos
    "
    " void test() {
    " }
    "
    " void
    " <-- cindent pos
    if l:orig_indent != &shiftwidth | return l:orig_indent | endif

    l:in_comment = 0
    l:pline_num = prevnonblank(l:cline_num - 1)
    while l:pline_num > -1
        l:pline = getline(l:pline_num)
        l:pline_indent = indent(l:pline_num)

        if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
            l:in_comment = 1
        elseif l:in_comment == 1
            if l:pline =~ '/\*\(.\{-}\*/\)\@!'
                l:in_comment = 0
            endif
        elseif l:pline_indent == 0
            if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
                if l:pline =~# '^\s*namespace.*'
                    return 0
                else
                    return l:orig_indent
                endif
            elseif l:pline =~# '\\$'
                return l:orig_indent
            endif
        else
            return l:orig_indent
        endif

        l:pline_num = prevnonblank(l:pline_num - 1)
    endwhile

    return l:orig_indent
endfunction

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab
setlocal textwidth=80
setlocal wrap

setlocal cindent
setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4

setlocal indentexpr=GoogleCppIndent()

b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

