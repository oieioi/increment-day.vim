increment-day.vim
======================

Increment the day of the week.

<a href="https://gyazo.com/40151b5a5a7ac699607cb33348ce3071"><img src="https://i.gyazo.com/40151b5a5a7ac699607cb33348ce3071.gif" alt="Image from Gyazo" width="314"/></a>

You execute `<C-a>` on a word, this script replaces it with next day:

- sun -> mon -> tue -> ...
- 月 -> 火 -> 水 -> ...

If the next day is not found, this executes default `<C-a>`.

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
