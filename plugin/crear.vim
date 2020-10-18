function! Crear()
  echo "Hola, probando"
endfun

command! -bang -nargs=? -complete=dir Crear
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse-list --bind enter:execute(echo "Hola"))']}, <bang>0)
