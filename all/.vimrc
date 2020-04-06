syntax enable

"文字コード
set encoding=utf-8
scriptencoding utf-8

set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"検索系
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
"カーソル
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

"クリップボード設定
set clipboard=unnamed,autoselect

"バックスペースの設定
set backspace=indent,eol,start

"escが遠いので代用する。(Ctrl + j)
noremap <C-j> <esc>
noremap! <C-j> <esc>
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
"その他
set showmatch " 括弧の対応関係を一瞬表示する
if &compatible
  set nocompatible               " Be iMproved
endif

"xやsでヤンクしないようにする
nnoremap x "_x
nnoremap s "_s

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END