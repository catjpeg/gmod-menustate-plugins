-- Функция для сохранения кода и ссылки в файлы
-- local function saveCodeAndLink(code, codeFilename, link, linkFilename)
--     file.Write(codeFilename, code)
--     file.Write(linkFilename, link)
--     print("Код успешно сохранен в файл " .. codeFilename)
--     print("Ссылка успешно сохранена в файл " .. linkFilename)
-- end

-- -- Оригинальная функция http.Fetch
-- local originalFetch = http.Fetch

-- -- Переопределение функции http.Fetch
-- http.Fetch = function(url, onSuccess, onFailure, headers, method, postData)
--     local callbackWrapper = function(body, size, headers, code)
--         -- Перехватываем код, переданный в callback и сохраняем в файл
--         saveCodeAndLink(body, "callback_code.txt", url, "callback_link.txt")
--         -- Вызываем оригинальный callback
--         onSuccess(body, size, headers, code)
--     end
--     originalFetch(url, callbackWrapper, onFailure, headers, method, postData)
-- end

local function getTimeString()
    local currentTime = os.time()
    return os.date("%Y-%m-%d_%H-%M-%S", currentTime)
end

-- Заменяем http.Fetch на свою функцию перехвата
local originalHttpFetch = http.Fetch

-- http.Fetch = function(url, onSuccess, onFailure, headers)
--     originalHttpFetch(url,
--         function(body, size, headers, code)
--             if code == 200 then
--                 local currentTimeString = getTimeString()
--                 local filename = "intercepted_code_" .. currentTimeString .. ".txt"
--                 if file.Write(filename, body) then
--                     print("Code successfully intercepted and saved as '" .. filename .. "'")
--                 else
--                     print("Failed to save intercepted code.")
--                 end
--             end

--             -- Вызываем исходный коллбэк
--             if onSuccess then
--                 onSuccess(body, size, headers, code)
--             end
--         end,
--         onFailure, headers
--     )
-- end


local function printCallback(funcName, ...)
    print("Callback from " .. funcName .. ":")

    -- Выводим аргументы
    local args = {...}
    for i, arg in ipairs(args) do
        print("Arg[" .. i .. "]: " .. tostring(arg))
    end

    -- Выводим результат выполнения функции (для RunStringEx)
    if funcName == "RunStringEx" then
        local result = table.remove(args, 1)
        print("Result: " .. tostring(result))
    end

    print("----------------------")
end

-- Заменяем функцию RunString на свою функцию с хуком
local originalRunString = RunString

RunString = function(code, ...)
    printCallback("RunString", code, ...)
    originalRunString(code, ...)
end

-- Заменяем функцию RunStringEx на свою функцию с хуком
local originalRunStringEx = RunStringEx

RunStringEx = function(code, ...)
    printCallback("RunStringEx", code, ...)
    originalRunStringEx(code, ...)
end
