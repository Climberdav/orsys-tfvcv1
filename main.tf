resource "openstack_compute_instance_v2" "backend" {
  name        = "backend-${var.suffix}"
  image_name  = "Ubuntu 22.04"
  flavor_name = "d2-2"
  key_pair    = openstack_compute_keypair_v2.keypair.name
  metadata = {
    tag = "session-terraform"
  }
  network {
    name        = ovh_cloud_project_network_private.net.name
    fixed_ip_v4 = "192.168.42.150"
  }
  depends_on = [ 
    ovh_cloud_project_network_private_subnet.subnet
   ]
}


resource "openstack_compute_instance_v2" "frontend" {
  count = length(var.front_ip)
  name        = "frontend-${var.suffix}-${count.index}"
  image_name  = "Ubuntu 22.04"
  flavor_name = "d2-2"
  key_pair    = openstack_compute_keypair_v2.keypair.name
  metadata = {
    tag = "session-terraform"
  }
  network {
    name = ovh_cloud_project_network_private.net.name
    fixed_ip_v4 = "192.168.42.${count.index + 2}"
  }
  network {
    name = "Ext-Net"
  }

  depends_on = [ 
    ovh_cloud_project_network_private_subnet.subnet
   ]
}