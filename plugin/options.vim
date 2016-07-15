"" vim: set fdm=marker:

"" I can't believe I have to do this
let datadir = ($XDG_DATA_HOME ? $XDG_DATA_HOME : $HOME) . '/.local/share/nvim'

"" [ Folds ] {{{

se fdm=marker
se fdo=insert,mark,quickfix,search,tag,undo
se fdls=99

"" }}}

"" [ Search ] {{{

se hls
se ic
se is
se scs

"" }}}

"" [ User Interface ] {{{

se nocul nocuc
set fillchars=diff:\ ,fold:┄,stl:━,stlnc:━,vert:┃
set listchars=conceal:?,eol:$,extends:…,nbsp:¬,precedes:…,tab:▏\ 
se ls=2
se mouse=ar
se nonu
se nowrap
se report=0
se ruler
se sc
se shm=atTAI
se siso=1
se sj=1
se smc=0
se so=999
se ss=1
se stal=2
se wic
se wim=longest:full,full
se wmnu

"" }}}

"" [ Windows ] {{{

set previewheight=15
se wmw=0
se wmh=0
se sb
se spr

"" }}}

"" [ Special Files & Directories ] {{{

se tags=./tags;,.git/tags;
se udf
let &udir = datadir . '/nvim/undo'

"" }}}

"" [ Vim Behaviour ] {{{

se ar
se bs=2
se cb=
se dip+=vertical,iwhite
se hi=1000
se hid
se inex=substitute(substitute(v:fname,'\\','/','g'),'^/\\+','','')
se isf+=\
se lz
se ml
se path=**
se re=0
se timeout
se nottimeout
se tm=500
se ttm=20
se ve=all
set viewoptions-=options

"" }}}

"" [ Insert Completion ] {{{

se cot+=menuone
se cot-=preview
se cpt=.,w,k,s,i,d,t
se ph=13

"" }}}

"" [ Formatting Options ] {{{

se flp=^\\s*\\(\\d\\+[\\]:.)}\\t\ ]\\\|[\\*\\-]\\)\\s*
se fo =
se fo+=a
se fo+=c
se fo+=j
se fo+=l
se fo+=n
se fo+=o
se fo+=q
se fo+=r
se fo+=w
se tw=120

"" }}}

"" [ Indentation & Tabs ] {{{

se ai
se et
se si
se sr
se sta
se sts=8
se sw=4

"" }}}
