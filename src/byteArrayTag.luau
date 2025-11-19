--!optimize 2

local types = require("./types")

local byteArrayTag = {}
byteArrayTag.__index = byteArrayTag

function byteArrayTag.withValue(self: types.BufferTag, value: buffer): types.BufferTag
    return table.freeze(setmetatable({
        value = value,
        id = self.id,
        name = self.name,
    }, byteArrayTag)) :: types.BufferTag
end

function byteArrayTag.new(name: string, value: buffer): types.BufferTag
    return table.freeze(setmetatable({
        value = value,
        id = types.BYTE_ARRAY,
        name = name,
    }, byteArrayTag)) :: types.BufferTag
end

return byteArrayTag

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
