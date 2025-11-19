--!optimize 2

local types = require("./types")

local listTag = {}
listTag.__index = listTag

function listTag.withValue<T>(self: types.ArrayTag<T>, value: { types.Tag<T> }): types.ArrayTag<T>
    return table.freeze(setmetatable({
        expects = self.expects,
        value = value,
        id = self.id,
        name = self.name,
    }, listTag)) :: types.ArrayTag<T>
end

function listTag.add<T>(self: types.ArrayTag<T>, value: types.Tag<T>)
    assert(
        self.expects == value.id,
        `attempt to add tag with id {value.id} to a list that expects {self.expects}`
    )
    table.insert(self.value, value)
end

function listTag.new<T>(name: string, expects: number): types.ArrayTag<T>
    return table.freeze(setmetatable({
        expects = expects,
        value = {},
        id = types.STRING,
        name = name,
    }, listTag)) :: types.ArrayTag<T>
end

return listTag

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
