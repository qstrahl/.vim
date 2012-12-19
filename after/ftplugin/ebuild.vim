if has("au")
    " Gentoo-specific settings for ebuilds. {{{
    " These are the federally-mandated required tab settings.  See the
    " following for more information:
    " http://www.gentoo.org/doc/en/xml/gentoo-howto.xml
    aug gentoo
        au!
        au BufRead,BufNewFile *.ebuild se ts=4 sw=4 noet
    aug END " }}}

endif
