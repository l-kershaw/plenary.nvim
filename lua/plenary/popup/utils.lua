local utils = {}

utils.bounded = function(value, min, max)
  min = min or 0
  max = max or math.huge

  if min then
    value = math.max(value, min)
  end
  if max then
    value = math.min(value, max)
  end

  return value
end

utils.apply_defaults = function(original, defaults)
  if original == nil then
    original = {}
  end

  original = vim.deepcopy(original)

  for k, v in pairs(defaults) do
    if original[k] == nil then
      original[k] = v
    end
  end

  return original
end

utils.resolve_borderchars = function(borderchars)
    local b_top, b_right, b_bot, b_left, b_topleft, b_topright, b_botright, b_botleft
    if borderchars == nil then
      b_top, b_right, b_bot, b_left, b_topleft, b_topright, b_botright, b_botleft =
        "═", "║", "═", "║", "╔", "╗", "╝", "╚"
    elseif #borderchars == 1 then
      local b_char = borderchars[1]
      b_top, b_right, b_bot, b_left, b_topleft, b_topright, b_botright, b_botleft =
        b_char, b_char, b_char, b_char, b_char, b_char, b_char, b_char
    elseif #borderchars == 2 then
      local b_char = borderchars[1]
      local c_char = borderchars[2]
      b_top, b_right, b_bot, b_left, b_topleft, b_topright, b_botright, b_botleft =
        b_char, b_char, b_char, b_char, c_char, c_char, c_char, c_char
    elseif #borderchars == 8 then
      b_top, b_right, b_bot, b_left, b_topleft, b_topright, b_botright, b_botleft = unpack(borderchars)
    else
      error(string.format 'Not enough arguments for "borderchars"')
    end
    return b_top, b_right, b_bot, b_left, b_topleft, b_topright, b_botright, b_botleft
end

return utils
