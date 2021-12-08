require("luci.sys")

if luci.sys.call("ps -w | grep tailscale |grep -v grep >/dev/null") == 0 then
	m = Map("tailscale", translate("tailscale"), "%s - %s" %{translate("tailscale"), translate("<strong><font color=\"green\">Running</font></strong>")})
else
	m = Map("tailscale", translate("tailscale"), "%s - %s" %{translate("tailscale"), translate("<strong><font color=\"red\">Not Running</font></strong>")})
end


------------------------------------------------------------
s = m:section(TypedSection, "base_arg", translate("base info"))
s.anonymous = true

o = s:option(Button,"up",translate("up"))
o.inputstyle = "apply"
o.write = function()
  luci.sys.call("cat /dev/null > /usr/share/tailscale/up.link") 
  luci.http.redirect(luci.dispatcher.build_url("admin", "vpn", "taiscale"))
end
------------------------------------------------------------

s=m:section(TypedSection,"base",translate("Update Log"))
s.anonymous=true
local a="/var/log/tailscale.log"
tvlog=s:option(TextValue,"sylogtext")
tvlog.rows=16
tvlog.readonly="readonly"
tvlog.wrap="off"

function tvlog.cfgvalue(s,s)
	sylogtext=""
	if a and nixio.fs.access(a) then
		sylogtext=luci.sys.exec("tail -n 100 %s"%a)
	end
	return sylogtext
end

tvlog.write=function(s,s,s)
end

local apply = luci.http.formvalue("cbi.apply")
if apply then
	io.popen("/etc/init.d/tailscale up &")
end

return m

------------------------------------------------------------




------------------------------------------------------------