local jump_target = require "hop.jump_target"
local hop = require "hop"

local M = {}
M.opts = {}

function M.hint_around_cursor(opts)
  opts = nil
  local targets = jump_target.jump_targets_by_scanning_lines(jump_target.regex_by_searching "\\v(.>|^$)")
  hop.hint_with(targets, opts)
end

function M.register(opts)
  M.opts = opts
end

return M
