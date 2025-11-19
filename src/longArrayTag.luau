--!optimize 2

local types = require("./types")

local longArrayTag = {}
longArrayTag.__index = longArrayTag

function longArrayTag.withValue<T>(
    self: types.NumberArrayTag,
    value: { types.NumberTag }
): types.NumberArrayTag
    return table.freeze(setmetatable({
        expects = self.expects,
        value = value,
        id = self.id,
        name = self.name,
    }, longArrayTag)) :: types.NumberArrayTag
end

function longArrayTag.add<T>(self: types.NumberArrayTag, value: types.NumberTag)
    table.insert(self.value, value)
end

function longArrayTag.new<T>(name: string): types.NumberArrayTag
    return table.freeze(setmetatable({
        expects = types.LONG,
        value = {},
        id = types.LONG_ARRAY,
        name = name,
    }, longArrayTag)) :: types.NumberArrayTag
end

return longArrayTag

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
