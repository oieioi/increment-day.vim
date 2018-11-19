function! IncrementDate(date)
  let file_path = expand('<sfile>:p:h')
  " FXIME: Vim scriptでかく
  let command = 'ruby ' . file_path . '/plugin/next_youbi.rb ' . a:date
  return system(command)
endfunction

function! ReadWordAndIncrementDay()
  let current = expand("<cword>")
  let next = IncrementDate(current)
  if next != ''
    execute ":normal ciw" . next
  endif
endfunction

command! IncrementDate call ReadWordAndIncrementDay()
" FIXME: ここに書いていいものなのか？
nnoremap <Space><C-a> :IncrementDate<CR>
