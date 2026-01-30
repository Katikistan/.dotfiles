set confirm off
set pagination off
set disassembly-flavor intel

define gef
  source ~/tools/gef/gef.py
end
define use_pwndbg
  source ~/tools/pwndbg/gdbinit.py
end

alias pwn = use_pwndbg
alias pwndbh = use_pwndbg

