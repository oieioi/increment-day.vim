let s:file_path = expand('<sfile>:p:h')

function! IncrementDate(date)
  " FXIME: Vim scriptでかく
  let command = 'ruby ' . s:file_path . '/next_youbi.rb ' . a:date
  return system(command)
endfunction

function! ReadWordAndIncrementDay()
  let current = expand("<cword>")
  let next = IncrementDate(current)
  if next != ''
    execute ":normal ciw" . next
  else
    " if no result, default <C-a>
    execute ":normal! \<C-a>"
  endif
endfunction

command! IncrementDate call ReadWordAndIncrementDay()
" FIXME: ここに書いていいものなのか？
nnoremap <C-a> :IncrementDate<CR>
