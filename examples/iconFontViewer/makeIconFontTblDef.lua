io.output("iconFontTblDef.nelua")
local sOut = [[
-- DON'T EDIT THIS FILE
-- This file is auto generated by "lua54 makeIconFontTblDef.lua"

require'IconsFontAwesome6'

global iconFontTbl: []cstring = {
]]
io.write(sOut)
for line in io.lines("../utils/fonticon/IconsFontAwesome6.nim") do
  for m1,m2 in string.gmatch(line,"%s+(.+)*%s=%s(.+)") do
    if string.match(m1,"ICON_FA") then
      io.write(m1 .. " .. \"" .. m1 .. "\" ,\n")
    end
  end
end
io.write("}")