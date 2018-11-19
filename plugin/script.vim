let s:file_path = expand('<sfile>:p:h')

function! IncrementOrDecrementDay(date, should_add)
  if a:should_add
    let options = ''
  else
    let options = '-d'
  endif

  " FIXME: Replace Ruby script with Vim script...
  let command = 'ruby ' . s:file_path . '/next_youbi.rb ' . a:date . ' ' . options
  return system(command)
endfunction

function! ReadWordAndIncrementOrDecrementDay(should_add)
  let current = expand("<cword>")
  let next = IncrementOrDecrementDay(current, a:should_add)

  if next != ''
    execute ":normal ciw" . next
  else
    " if no result, default <C-a>
    if a:should_add
      execute ":normal! \<C-a>"
    else
      execute ":normal! \<C-x>"
    end
  endif
endfunction

command! IncrementDay call ReadWordAndIncrementOrDecrementDay(1)
command! DecrementDay call ReadWordAndIncrementOrDecrementDay(0)

"nnoremap <C-a> :IncrementDay<CR>
"nnoremap <C-x> :DecrementDay<CR>
