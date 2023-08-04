-- Папка, в которой будут сохраняться txt файлы
local folderName = "lua_logs"
-- Создаем папку, если её нет
if not file.Exists(folderName, "DATA") then
    file.CreateDir(folderName)
end

local function GetFormattedDateTime()
    local currentTime = os.time()
    return os.date("%Y-%m-%d %H:%M:%S", currentTime)
end

-- Функция для записи текста в файл с указанием даты и времени
local function WriteLog(fileName, content)
    local dateTime = GetFormattedDateTime()
    local logContent = dateTime .. "\n" .. content
    file.Write("data/" .. folderName .. "/" .. fileName, logContent)
end

-- Функция, которая записывает изменения в txt файл с указанием даты и времени
local function LogChanges(fileName, action, code)
    local logContent = action .. ":\n" .. code .. "\n\n"
    WriteLog(fileName, logContent)
end

-- Функция, которая будет выполняться при загрузке каждого Lua файла с указанием даты и времени
local function LogCodeExecution(fileName, code)
    local dateTime = GetFormattedDateTime()
    local logContent = dateTime .. "\n" .. "Executed " .. fileName .. ":\n" .. code .. "\n\n"
    WriteLog(fileName, logContent)
end

-- -- Хук, который будет вызываться при изменении Lua кода (при обновлении меню-состояния)
-- hook.Add("MenuStateCodeUpdated", "LogMenuStateChanges", function(fileName, code)
--     LogChanges(fileName .. "_changes1.txt", "Updated", code)
-- end)

-- -- Хук, который будет вызываться при добавлении Lua кода (при добавлении нового меню-состояния)
-- hook.Add("MenuStateCodeAdded", "LogMenuStateAdditions", function(fileName, code)
--     LogChanges(fileName .. "_changes2.txt", "Added", code)
-- end)

-- -- Хук, который будет вызываться при удалении Lua кода (при удалении меню-состояния)
-- hook.Add("MenuStateCodeRemoved", "LogMenuStateDeletions", function(fileName, code)
--     LogChanges(fileName .. "_changes3.txt", "Removed", code)
-- end)

-- -- Хук, который будет вызываться при загрузке Lua файла
-- hook.Add("MenuStateCodeLoaded", "LogCodeExecution", function(fileName, code)
--     LogCodeExecution(fileName .. "_execution.txt", code)
-- end)

-- print("Hooks registered:", hook.GetTable()["MenuStateCodeUpdated"] ~= nil,
--                          hook.GetTable()["MenuStateCodeAdded"] ~= nil,
--                          hook.GetTable()["MenuStateCodeRemoved"] ~= nil,
--                          hook.GetTable()["MenuStateCodeLoaded"] ~= nil)