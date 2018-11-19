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
  endif
endfunction

command! IncrementDate call ReadWordAndIncrementDay()
" FIXME: ここに書いていいものなのか？
nnoremap <Space><C-a> :IncrementDate<CR>
