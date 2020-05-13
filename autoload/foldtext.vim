function! foldtext#foldtext ()
  "" Compute the number of lines folded
  let folded = v:foldend - v:foldstart

  if &diff
    return v:folddashes . '[ ' . folded . ' ' . (folded == 1 ? 'line' : 'lines') . ' folded ]'
  endif

  "" Get the character used for fold dashes
  let dash = v:folddashes[0]

  "" Get a string of dashes equal to the indent level of the first line of the fold
  let dashes = repeat(dash, indent(v:foldstart))

  "" Get first and last lines of fold, minus their indents, and uncommented if applicable
  let start = getline(v:foldstart)[indent(v:foldstart):]
  let end = s:uncomment(getline(v:foldend)[indent(v:foldend):])

  "" Get list of &comments flag:string tuples
  let comments = map(split(&comments, ','), 'split(v:val, ":")')
  let leaders = map(filter(copy(comments), 'stridx(v:val[0], "s") >= 0'), 'v:val[1]')

  let commentsummary = ''

  "" Treat folded multi-line comments specially (slightly hackish)
  for leader in leaders
    if stridx(start, leader) == 0
      for line in getline(v:foldstart, v:foldend)
        let commentsummary = substitute(line, '\v\W*(.*)\s*\W*\s*$', '\1', '')
        if len(commentsummary)
          let commentsummary = ' ' . commentsummary
          break
        endif
      endfor
    endif
  endfor

  "" Create a little comment about how many lines have been folded
  let comment = printf(&commentstring, ' ' . folded . ' ' . (folded == 1 ? 'line' : 'lines') . ' folded')

  let text = dashes . start . commentsummary . '…'
  let text .= (len(commentsummary) ? ' ' : '') . end
  let text .= ' ' . comment

  return text
endfunction

function! s:uncomment (text)
  let items = split(&commentstring, '%s')

  let find = '\v^\s*\V'
  let find .= escape(get(items, 0, ''), '\')
  let find .= '\v\s*(.*)\s*\V'
  let find .= escape(get(items, 1, ''), '\')
  let find .= '\v\s*$'

  return substitute(a:text, find, '\1', '')
endfunction

set foldtext=foldtext#foldtext()
