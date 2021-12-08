module("luci.controller.tailscale",package.seeall)

function index()
  entry({"admin", "vpn", "taiscale"}, alias("admin", "vpn", "taiscale","tailscale"), _("Tailscale穿透"), 45)
  entry({"admin","vpn", "tailscale"}, firstchild(), _("Tailscale")).dependent = false
  -- entry({"admin", "vpn", "tailscale"}, call("tail_up"))

end