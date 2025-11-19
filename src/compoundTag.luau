--!optimize 2

local types = require("./types")

local compoundTag = {}
compoundTag.__index = compoundTag

function compoundTag.withValue(
    self: types.CompoundTag,
    value: { [string]: types.Tag<any> }
): types.CompoundTag
    return table.freeze(setmetatable({
        value = value,
        id = self.id,
        name = self.name,
    }, compoundTag)) :: types.CompoundTag
end

function compoundTag.put<T>(self: types.CompoundTag, key: string, value: types.Tag<T>)
    assert(self:contains(key) == false, `'{key}' has already been inserted`)
    self.value[key] = value
end

function compoundTag.get<T>(self: types.CompoundTag, key: string): types.Tag<T>
    assert(self:contains(key) == true, `'{key}' not found in map`)
    return self.value[key]
end

function compoundTag.remove<T>(self: types.CompoundTag, key: string): (boolean, types.Tag<T>?)
    if self:contains(key) == false then
        return false, nil
    end
    local value = self.value[key]
    self.value[key] = nil
    return true, value
end

function compoundTag.contains<T>(self: types.CompoundTag, key: string): boolean
    return self.value[key] ~= nil
end

function compoundTag.computeIfAbsent<T>(
    self: types.CompoundTag,
    key: string,
    ifAbsent: (string) -> types.Tag<T>
): types.Tag<T>
    if self:contains(key) == false then
        self.value[key] = ifAbsent(key)
    end
    return self.value[key]
end

function compoundTag.new(name: string): types.CompoundTag
    return table.freeze(setmetatable({
        value = {},
        id = types.COMPOUND,
        name = name,
    }, compoundTag)) :: types.CompoundTag
end

return compoundTag

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
