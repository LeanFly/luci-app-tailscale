module("luci.controller.vpn.tailscale",package.seeall)

function index()
  entry({"admin", "vpn", "taiscale"}, _("Tailscale穿透"), 54)
  entry({"admin","vpn", "tailscale"}, firstchild(), _("Tailscale")).dependent = false
  -- entry({"admin", "vpn", "tailscale"}, call("tail_up"))

end