--!optimize 2

local types = require("./types")

local intArrayTag = {}
intArrayTag.__index = intArrayTag

function intArrayTag.withValue<T>(
    self: types.NumberArrayTag,
    value: { types.NumberTag }
): types.NumberArrayTag
    return table.freeze(setmetatable({
        expects = self.expects,
        value = value,
        id = self.id,
        name = self.name,
    }, intArrayTag)) :: types.NumberArrayTag
end

function intArrayTag.add<T>(self: types.NumberArrayTag, value: types.NumberTag)
    table.insert(self.value, value)
end

function intArrayTag.new<T>(name: string): types.NumberArrayTag
    return table.freeze(setmetatable({
        expects = types.INT,
        value = {},
        id = types.INT_ARRAY,
        name = name,
    }, intArrayTag)) :: types.NumberArrayTag
end

return intArrayTag

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
