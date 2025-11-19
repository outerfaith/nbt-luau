--!optimize 2

local types = require("./types")

local longTag = {}
longTag.__index = longTag

function longTag.withValue(self: types.NumberTag, value: number): types.NumberTag
    return table.freeze(setmetatable({
        value = value,
        id = self.id,
        name = self.name,
    }, longTag)) :: types.NumberTag
end

function longTag.new(name: string, value: number): types.NumberTag
    assert(
        value >= -9007199254740991 and value <= 9007199254740991,
        "value out of bounds for long (2^53)"
    )
    assert(value % 1 == 0, "value must be an integer")

    return table.freeze(setmetatable({
        value = value,
        id = types.LONG,
        name = name,
    }, longTag)) :: types.NumberTag
end

return longTag

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
