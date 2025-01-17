-- File: controller/admin/terminal.lua

module("luci.controller.admin.terminal", package.seeall)

function index()
    entry({"admin", "status", "terminal"}, template("admin_status/terminal"), _("Web Terminal"), 10)
    entry({"admin", "status", "terminal_exec"}, call("action_exec"), nil).leaf = true
end

function action_exec()
    local util = require("luci.util")
    local http = require("luci.http")

    local cmd = http.formvalue("cmd")
    if cmd then
        local output = util.trim(util.exec(cmd))
        http.prepare_content("text/plain")
        http.write(output)
    else
        http.status(400, "Bad Request")
        http.write("No command provided")
    end
end
