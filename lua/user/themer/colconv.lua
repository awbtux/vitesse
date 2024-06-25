local M = {}

-- color conversion functions

-- convert a hex color value to rgb
-- @param hex: the hex color value
-- @return r: red (0-255)
-- @return g: green (0-255)
-- @return b: blue (0-255)
M.hex2rgb = function(hex)
    local hash = string.sub(hex, 1, 1) == "#"
    if string.len(hex) ~= (7 - (hash and 0 or 1)) then
        return nil
    end

    local r = tonumber(hex:sub(2 - (hash and 0 or 1), 3 - (hash and 0 or 1)), 16)
    local g = tonumber(hex:sub(4 - (hash and 0 or 1), 5 - (hash and 0 or 1)), 16)
    local b = tonumber(hex:sub(6 - (hash and 0 or 1), 7 - (hash and 0 or 1)), 16)
    return r, g, b
end

-- convert an rgb color value to hex
-- @param r: red (0-255)
-- @param g: green (0-255)
-- @param b: blue (0-255)
-- @return the hexadecimal string representation of the color
M.rgb2hex = function(r, g, b)
    return string.format("#%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

-- helper function to convert a hsl color value to rgb
-- not to be used directly, use m.hsl2rgb instead
M.hsl2rgb_helper = function(p, q, a)
    if a < 0 then
        a = a + 6
    end
    if a >= 6 then
        a = a - 6
    end
    if a < 1 then
        return (q - p) * a + p
    elseif a < 3 then
        return q
    elseif a < 4 then
        return (q - p) * (4 - a) + p
    else
        return p
    end
end

-- convert an hsl color value to rgb
-- @param h: hue (0-360)
-- @param s: saturation (0-1)
-- @param l: lightness (0-1)
-- @return r: red (0-255)
-- @return g: green (0-255)
-- @return b: blue (0-255)
M.hsl2rgb = function(h, s, l)
    local t1, t2, r, g, b

    h = h / 60
    if l <= 0.5 then
        t2 = l * (s + 1)
    else
        t2 = l + s - (l * s)
    end

    t1 = l * 2 - t2
    r = M.hsl2rgb_helper(t1, t2, h + 2) * 255
    g = M.hsl2rgb_helper(t1, t2, h) * 255
    b = M.hsl2rgb_helper(t1, t2, h - 2) * 255

    return r, g, b
end

-- convert an rgb color value to hsl
-- @param r red (0-255)
-- @param g green (0-255)
-- @param b blue (0-255)
-- @return h hue (0-360)
-- @return s saturation (0-1)
-- @return l lightness (0-1)
M.rgb2hsl = function(r, g, b)
    local min, max, l, s, maxcolor, h
    r, g, b = r / 255, g / 255, b / 255

    min = math.min(r, g, b)
    max = math.max(r, g, b)
    maxcolor = 1 + (max == b and 2 or (max == g and 1 or 0))

    if maxcolor == 1 then
        h = (g - b) / (max - min)
    elseif maxcolor == 2 then
        h = 2 + (b - r) / (max - min)
    elseif maxcolor == 3 then
        h = 4 + (r - g) / (max - min)
    end

    if not rawequal(type(h), "number") then h = 0 end

    h = h * 60

    if h < 0 then h = h + 360 end

    l = (min + max) / 2

    if min == max then
        s = 0
    else
        if l < 0.5 then
            s = (max - min) / (max + min)
        else
            s = (max - min) / (2 - max - min)
        end
    end

    return h, s, l
end

-- convert a hex color value to hsl
-- @param hex: the hex color value
-- @param h: hue (0-360)
-- @param s: saturation (0-1)
-- @param l: lightness (0-1)
M.hex2hsl = function(hex)
    local r, g, b = M.hex2rgb(hex)
    return M.rgb2hsl(r, g, b)
end

-- convert a hsl color value to hex
-- @param h: hue (0-360)
-- @param s: saturation (0-1)
-- @param l: lightness (0-1)
-- @returns hex color value
M.hsl2hex = function(h, s, l)
    local r, g, b = M.hsl2rgb(h, s, l)
    return M.rgb2hex(r, g, b)
end

-- change the hue of a color by a given amount
-- @param hex the hex color value
-- @param amount the amount to change the hue.
--                           negative values decrease the hue, positive values increase it.
-- @return the hex color value
M.shift_hex = function(hex, percent)
    local h, s, l = M.hex2hsl(hex)
    h = h + (percent / 100)
    if h > 360 then
        h = 360
    end
    if h < 0 then
        h = 0
    end
    return M.hsl2hex(h, s, l)
end

-- desaturate or saturate a color by a given percentage
-- @param hex the hex color value
-- @param percent the percentage to desaturate or saturate the color.
--                              negative values desaturate the color, positive values saturate it
-- @return the hex color value
M.saturate_hex = function(hex, percent)
    local h, s, l = M.hex2hsl(hex)
    s = s + (percent / 100)
    if s > 1 then
        s = 1
    end
    if s < 0 then
        s = 0
    end
    return M.hsl2hex(h, s, l)
end

-- lighten or darken a color by a given percentage
-- @param hex the hex color value
-- @param percent the percentage to lighten or darken the color.
--                              negative values darken the color, positive values lighten it
-- @return the hex color value
M.lighten_hex = function(hex, percent)
    local h, s, l = M.hex2hsl(hex)
    l = l + (percent / 100)
    if l > 1 then
        l = 1
    end
    if l < 0 then
        l = 0
    end
    return M.hsl2hex(h, s, l)
end

-- compute a gradient between two colors
-- @param hex1 the first hex color value
-- @param hex2 the second hex color value
-- @param steps the number of steps to compute
-- @return a table of hex color values
M.compute_gradient = function(hex1, hex2, steps)
    local h1, s1, l1 = M.hex2hsl(hex1)
    local h2, s2, l2 = M.hex2hsl(hex2)
    local h, s, l
    local h_step = (h2 - h1) / (steps - 1)
    local s_step = (s2 - s1) / (steps - 1)
    local l_step = (l2 - l1) / (steps - 1)
    local gradient = {}

    for i = 0, steps - 1 do
        h = h1 + (h_step * i)
        s = s1 + (s_step * i)
        l = l1 + (l_step * i)
        gradient[i + 1] = M.hsl2hex(h, s, l)
    end

    return gradient
end

return M
