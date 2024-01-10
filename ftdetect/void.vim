autocmd BufNewFile,BufRead * if match(getline(1),"# Template file for") >= 0 | call VoidOptions() | endif
function VoidOptions()
  set filetype=sh
  FormatDisable
endfunction
