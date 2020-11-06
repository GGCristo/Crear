function! Main(line)
      call fzf#run(fzf#wrap({'source': 'find * -type d',
      \ 'options': '--prompt "Crea> "',
      \ 'sink': function('Crear', [a:line])}))
endfun

function! Crear(nombre, ruta)
"au BufNewFile,BufRead *.cxx,*.c++,*.hh,*.hxx,*.hpp,*.ipp,*.moc,*.tcc,*.inl setf cpp
  let list = ['cxx', 'c++', 'hh', 'hxx', 'hpp', 'ipp', 'moc', 'tcc', 'inl', 'setf', 'cpp',
        \ 'rb']
  let formato = matchstr(a:nombre, '.*\.\zs.*')
  if Find_entity(list, formato) >= 0
    execute '!touch ' . expand(a:ruta) . '/' . expand(a:nombre)
    execute 'e ' . expand(a:ruta) . '/' . expand(a:nombre)
    echo "A file has been created in " . expand(a:ruta) . '/' . expand(a:nombre)
  else
    execute '!mkdir ' . expand(a:ruta) . '/' . expand(a:nombre)
    execute 'e ' . expand(a:ruta) . '/' . expand(a:nombre)
    echo "A directory has been created in " . expand(a:ruta) . '/' . expand(a:nombre)
  endif
endfun

command! -bang -nargs=1 -complete=file Crear
      \ call Main(<q-args>)

command! -bang -nargs=1 -complete=file Crea
      \ call Main(<q-args>)

"(https://github.com/LucHermitte/lh-vim-lib)
function! Find_entity(list, value) abort
  let found = map(copy(a:list), 'v:val is a:value')
  return index(found, 1)
endfunction
