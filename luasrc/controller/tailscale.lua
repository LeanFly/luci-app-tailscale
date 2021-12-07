module("luci.controller.tailscale",package.seeall)

function index()
  if not nixio.fs.access("/etc/config/tailscale") then
    return
  end

  entry({"admin","vpn"}, firstchild(), "VPN", 45).dependent = false
  entry({"admin","vpn", "tailscale"}, firstchild(), _("Tailscale")).dependent = false
  entry({"admin", "vpn", "tailscale", "general"}, cbi("Tailscale/tailscale_status"), _("Base Setting"), 1)
  entry({"admin", "vpn", "tailscale", "log"}, form("tailscale/status"), _("Interface Status"), 2)
  entry({"admin","vpn","tailscale","status"},call("act_status"))
end

function act_status()
local e={}
  e.running=luci.sys.call("pgrep /usr/bin/tailscale >/dev/null")==0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
