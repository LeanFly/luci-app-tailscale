module("luci.controller.tailscale",package.seeall)

function index()
  if not nixio.fs.access("/etc/config/tailscale") then
    return
  end

  entry({"admin","vpn"}, firstchild(), "VPN", 45).dependent = false
  entry({"admin","vpn", "tailscale"}, firstchild(), _("Tailscale")).dependent = false
  entry({"admin", "vpn", "tailscale", "status"}, form("tailscale/status"), _("Tailscale Status") , 1, call("tail_up"))

  entry({"admin","vpn","tailscale","status"},call("act_status"))
end

function act_status()
local e={}
  e.running=luci.sys.call("tailscale up")==0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end

function tail_up()
  local info = luci.sys.exec("tailscale")
  local infoup = luci.sys.exec("tailscale up")
  m.Map("up", translate("uplink"),translate("uplink") .. "<br>info: <a href=' " .. infoup .. ": '>" .. infoup)
