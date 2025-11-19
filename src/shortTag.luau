--!optimize 2

local types = require("./types")

local shortTag = {}
shortTag.__index = shortTag

function shortTag.withValue(self: types.NumberTag, value: number): types.NumberTag
    return table.freeze(setmetatable({
        value = value,
        id = self.id,
        name = self.name,
    }, shortTag)) :: types.NumberTag
end

function shortTag.new(name: string, value: number): types.NumberTag
    assert(value >= -32768 and value <= 32767, "value out of bounds for short")
    assert(value % 1 == 0, "value must be an integer")

    return table.freeze(setmetatable({
        value = value,
        id = types.SHORT,
        name = name,
    }, shortTag)) :: types.NumberTag
end

return shortTag

--[[
   Copyright 2025 Outerfaith
                  Contributors

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
]]
