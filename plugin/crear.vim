function! Main(line)
      call fzf#run(fzf#wrap({'source': 'find -type d | cut -c 3-',
      \ 'options': '--layout=reverse-list', 'sink': function('Crear', [a:line])}))
endfun

function! Crear(nombre, ruta)
  let list = ['cpp', 'rb']
  let formato = matchstr(a:nombre, '.*\.\zs.*')
  if Find_entity(list, formato) >= 0
    execute 'e ' . expand(a:ruta) . '/' . expand(a:nombre)
  else
    execute '!mkdir ' . expand(a:ruta) . '/' . expand(a:nombre)
    execute 'e ' . expand(a:ruta) . '/' . expand(a:nombre)
  endif
endfun
" !empty(getcompletion('', 'filetype'))
command! -bang -nargs=1 -complete=file Crear
      \ call Main(<q-args>)

command! -bang -nargs=1 -complete=file Crea
      \ call Main(<q-args>)
" /.*\.\zs.*
"matchstr('nombre', '.*\.\zs.*')
"echo !empty(getcompletion(matchstr('main.cpp', '.*\.\zs.*'), 'filetype'))
"main.cpp
function! Find_entity(list, value) abort
  let found = map(copy(a:list), 'v:val is a:value')
  return index(found, 1)
endfunction
