module("luci.controller.tailscale",package.seeall)

function index()

entry({"admin","VPN","tailscale"},cbi("tailscale"),_("TAILSCALE"),45).acl_depends = { "luci-app-tailscale" }
entry({"admin","vpn","tailscale","status"},call("act_status"))
end

function act_status()
local e={}
  e.running=luci.sys.call("pgrep /usr/bin/tailscale >/dev/null")==0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
