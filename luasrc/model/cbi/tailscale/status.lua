local fs = require "nixio.fs"
local conffile = "/tmp/tailscale.status"

f = SimpleForm("logview")

t = f:field(TextValue, "conf")
t.rmempty = true
t.rows = 15
function t.cfgvalue()
  luci.sys.exec("for i in $(ifconfig | grep 'ts' | awk '{print $1}'); do ifconfig $i; done > /tmp/tailscale.status")
	return fs.readfile(conffile) or ""
end
t.readonly="readonly"

return f
