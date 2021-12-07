a = Map("Tailscale")
a.tittle = translate("Tailscale")
a.description = translate("Tailscale is an open source, cross-platform and easy to use virtual LAN")

a:section(SimpleSection).template = "Tailscale/tailscale"
a.anonymous = true
a.addremove = false

e = t:option(Flag, "enable", translate("Enable"))
e.default = 0
e.rmempty = false

e = t:option(DynamicList, "up", translate("Tailscale up"))
e.default = ""
e.rmempty = false

e = t:option(Flag, "down", translate("Tailscale down"))

e = t:option(Flag, "ip", translate("Tailscale ip"))

e = t:option(DummyValue, "opennewwindow", translate("<input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"tailscale.com\" onclick=\"window.open('https://login.tailscale.com')\" />"))
e.description = translate("Login and manage your tailscale network")
return a
