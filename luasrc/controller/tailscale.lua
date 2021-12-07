module("luci.controller.tailscale",package.seeall)

function index()
  if not nixio.fs.access("/etc/config/tailscale") then
    return
  end

  entry({"admin","vpn"}, firstchild(), "VPN", 45).dependent = false
  entry({"admin","vpn", "tailscale"}, firstchild(), _("Tailscale")).dependent = false
  entry({"admin", "vpn", "tailscale"}, call("tail_up"))

end

function tail_up()
  local info = luci.sys.exec("tailscale")
  local infoup = luci.sys.exec("tailscale up")
  m.Map("tailscale", translate("uplink"),translate("uplink") .. "<br>info: <a href=' " .. infoup .. ": '>" .. infoup)
end
