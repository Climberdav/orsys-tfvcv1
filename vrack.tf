resource "ovh_cloud_project_network_private" "net" {
  service_name = "df9987268a2241d0bc2156a19c411de4"
  name         = "private-${var.suffix}"
  regions      = ["GRA11"]
  vlan_id      = 99
}

resource "ovh_cloud_project_network_private_subnet" "subnet" {
  service_name = "df9987268a2241d0bc2156a19c411de4"
  network_id   = ovh_cloud_project_network_private.net.id
  region       = "GRA11"
  start        = "192.168.42.2"
  end          = "192.168.42.200"
  network      = "192.168.42.0/24"
  dhcp         = false
  no_gateway   = true
}