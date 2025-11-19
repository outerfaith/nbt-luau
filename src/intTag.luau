--!optimize 2

local types = require("./types")

local intTag = {}
intTag.__index = intTag

function intTag.withValue(self: types.NumberTag, value: number): types.NumberTag
    return table.freeze(setmetatable({
        value = value,
        id = self.id,
        name = self.name,
    }, intTag)) :: types.NumberTag
end

function intTag.new(name: string, value: number): types.NumberTag
    assert(value >= -2147483648 and value <= 2147483647, "value out of bounds for int")
    assert(value % 1 == 0, "value must be an integer")

    return table.freeze(setmetatable({
        value = value,
        id = types.INT,
        name = name,
    }, intTag)) :: types.NumberTag
end

return intTag

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
