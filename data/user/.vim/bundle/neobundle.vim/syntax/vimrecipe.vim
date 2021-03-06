"=============================================================================
" FILE: syntax/recipe.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu@gmail.com>
" Last Modified: 15 Sep 2010
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

let s:save_cpo = &cpo
set cpo&vim

if version < 700
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syntax region  recipeString    start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=recipeEscape
syntax region  recipeString    start=+'+  skip=+\\\\\|\\"+  end=+'+

syntax match   recipeEscape    '\\["\\/bfnrt]' contained
syntax match   recipeEscape    '\\u\x\{4}' contained

syntax match   recipeNumber    '-\?\<\%(0\|[1-9]\d*\)\%(\.\d\+\)\?\>'

syntax match   recipeBraces    '[{}\[\]]'
syntax match   recipeComment   '^\s*#.*$'


highlight def link recipeString             String
highlight def link recipeEscape             Special
highlight def link recipeNumber             Number
highlight def link recipeBraces             Operator
highlight def link recipeComment            Comment

let b:current_syntax = 'recipe'

let &cpo = s:save_cpo
unlet s:save_cpo
