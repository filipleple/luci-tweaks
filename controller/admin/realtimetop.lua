-- File: controller/admin/realtimetop.lua

module("luci.controller.admin.realtimetop", package.seeall)

function index()
    entry({"admin", "status", "realtimetop"}, call("action_top"), _("Real-Time Top"), 10)
end

function action_top()
    local util = require("luci.util")
    -- Run the `top` command and capture output (1-second refresh)
    local output = util.trim(util.exec("top -b -n 1"))
    luci.http.prepare_content("text/plain")
    luci.http.write(output)
end
