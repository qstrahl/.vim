local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup {
  check_ts = true,
}

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- for _, start_pair in ipairs({ '(', '[', '{' }) do
--   local rule = npairs.get_rule(start_pair)

--   npairs.add_rule(Rule(rule.start_pair, rule.end_pair)
--     :use_key('q')
--     :replace_endpair(function(opts)
--       print('OPTS')
--       print(vim.inspect(opts))
--       return 'foo'
--     end)
--   )

-- --   if rule ~= nil then
-- --     function replace()
-- --       return 'foo'
-- --     end

-- --     function check_pair(opts)
-- --       return true
-- --     end

-- --     rule
-- --       :use_key(rule.end_pair)
-- --       :replace_endpair(replace, check_pair)
-- --   end
-- end
