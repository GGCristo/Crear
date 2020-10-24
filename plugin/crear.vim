function! Ma(line)
      call fzf#run(fzf#wrap({'source': 'find -type d | cut -c 3-',
      \ 'options': '--layout=reverse-list', 'sink': function('Crear', [a:line])}))
endfun

function! Crear(nombre, ruta)
  execute '!mkdir ' . expand(a:ruta) . '/' . expand(a:nombre)
endfun

command! -bang -nargs=1 -complete=file Crear
      \ call Ma(<q-args>)
