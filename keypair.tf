resource "openstack_compute_keypair_v2" "keypair" {
  name       = "keypair-${var.suffix}"
  public_key = file("~/.ssh/id_rsa.pub")
}