function! Crear()
  echo "Hola, probando"
endfun

command! -bang -nargs=? -complete=dir Crear
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse']}, <bang>0)
