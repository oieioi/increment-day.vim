function! IncrementDate(date)
  let command = 'ruby ./next_youbi.rb ' . a:date
  " FXIME: Vim scriptでかく
  return system(command)
endfunction

let next = IncrementDate('月')
echo next
