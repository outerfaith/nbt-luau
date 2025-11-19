--!optimize 2

export type Tag<T> = {
    withValue: (self: Tag<T>, value: T) -> Tag<T>,
    read value: T,
    read id: number,
    read name: string,
}

export type EndTag = Tag<nil>

export type NumberTag = Tag<number>

export type BufferTag = Tag<buffer>

export type StringTag = Tag<string>

export type ArrayTag<T> = Tag<{ Tag<T> }> & {
    add: (self: ArrayTag<T>, value: Tag<T>) -> (),
    read expects: number,
}

export type CompoundTag = Tag<{ [string]: Tag<any> }> & {
    put: <T>(self: CompoundTag, key: string, value: Tag<T>) -> (),
    get: <T>(self: CompoundTag, key: string) -> Tag<T>,
    remove: <T>(self: CompoundTag, key: string) -> (boolean, Tag<T>?),
    contains: (self: CompoundTag, key: string) -> boolean,
    computeIfAbsent: <T>(self: CompoundTag, key: string, ifAbsent: (string) -> Tag<T>) -> Tag<T>,
}

export type NumberArrayTag = ArrayTag<number>

return table.freeze({
    END = 0x00,
    BYTE = 0x01,
    SHORT = 0x02,
    INT = 0x03,
    LONG = 0x04,
    FLOAT = 0x05,
    DOUBLE = 0x06,
    BYTE_ARRAY = 0x07,
    STRING = 0x08,
    LIST = 0x09,
    COMPOUND = 0x0A,
    INT_ARRAY = 0x0B,
    LONG_ARRAY = 0x0C,
})

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
