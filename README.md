increment-day.vim
======================

Increment the day of the week.

<a href="https://gyazo.com/367f95c2cc2bfcdfbd11714a0f6885d9"><img src="https://i.gyazo.com/367f95c2cc2bfcdfbd11714a0f6885d9.gif" alt="Running increment-day.vim" width="358"/></a>

You execute `<C-a>` on a word, this script replaces it with the next day:

- `sun` -> `mon` -> `tue` -> ...
- `月` -> `火` -> `水` -> ...

If the next day is not found, this executes default `<C-a>` (sorry, this feature is buggy. :cold_sweat:).

Install
--------

dein.vim

```toml:your_dein.toml
[[plugins]]
repo = 'oieioi/increment-day.vim'
hook_add = '''
  nnoremap <C-a> :IncrementDay<CR>
  nnoremap <C-x> :DecrementDay<CR>
'''
```
