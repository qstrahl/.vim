syn region  htmlRegion   start=+<\z([^ /!?<>"']\+\)+ skip=+<!--\_.\{-}-->+ end=+</\z1\_\s\{-}>+ end=+/>+ fold contains=htmlTag,htmlEndTag,htmlRegion,htmlComment,@Spell keepend extend
