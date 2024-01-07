resource "oci_identity_compartment" "compartment" {
    compartment_id = var.tenancy_ocid
    description = var.compartment_description
    name = var.compartment_name
}

resource "oci_core_vcn" "vcn" {
    compartment_id = oci_identity_compartment.compartment.compartment_id
    cidr_blocks = ["192.168.0.0/16"]
}

resource "oci_core_subnet" "subnet" {
    cidr_block = "192.168.0.0/16"
    compartment_id = oci_identity_compartment.compartment.compartment_id
    vcn_id = oci_core_vcn.vcn.id
}

output "compartment_id" {
    value = oci_identity_compartment.compartment.compartment_id
}

output "subnet_id" {
    value = oci_core_subnet.subnet.id
}