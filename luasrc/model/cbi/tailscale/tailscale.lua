local e=luci.model.uci.cursor()
local e
local e=luci.http.formvalue("cbi.apply")
if e then
	io.popen("/etc/init.d/tailscale restart")
end

