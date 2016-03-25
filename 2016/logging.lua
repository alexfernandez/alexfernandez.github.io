-- Copyright (C) 2012 Matthieu Tourne
-- @author Matthieu Tourne <matthieu@cloudflare.com>
-- As published in https://github.com/mtourne/nginx_log_by_lua
-- @author Alex Fernández <alexfernandeznpm@gmail.com>
-- Modifications to return sum and count for all HTTP status codes

-- Simple helper functions for logging

local logging = {}

local module = logging

local function incr(dict, key, increment)
   increment = increment or 1
   local newval, err = dict:incr(key, increment)
   if err then
      dict:set(key, increment)
      newval = increment
   end
   return newval
end

function logging.add_plot(dict, key, value)
   local sum_key = key .. "-sum"
   local count_key = key .. "-count"

   local sum = incr(dict, sum_key, value)
   incr(dict, count_key)
end

function logging.get_plot(dict, key)
   local sum_key = key .. "-sum"
   local count_key = key .. "-count"

   local elapsed_time = 0
   local avg = 0

   local count = dict:get(count_key) or 0

   local sum = dict:get(sum_key) or 0

   if count > 0 then
      avg = sum / count
   end

   return count, avg, elapsed_time
end

function logging.get_all(dict)
   local all = {}
   local value = 0
   local keys = dict:get_keys()

   for n, key in pairs(keys) do
      value = dict:get(key)
      all[key] = value
   end
   return all
end


-- safety net
local module_mt = {
   __newindex = (
      function (table, key, val)
         error('Attempt to write to undeclared variable "' .. key .. '"')
      end),
}

setmetatable(module, module_mt)

-- expose the module
return logging
