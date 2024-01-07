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
    route_table_id = oci_core_route_table.rt.id
}

resource "oci_core_internet_gateway" "ig" {
    compartment_id = oci_identity_compartment.compartment.compartment_id
    vcn_id = oci_core_vcn.vcn.id
    enabled = true
}

resource "oci_core_route_table" "rt" {
    compartment_id = oci_identity_compartment.compartment.compartment_id
    vcn_id = oci_core_vcn.vcn.id
    route_rules {
        network_entity_id = oci_core_internet_gateway.ig.id
        destination = "0.0.0.0/0"
    }
}

resource "oci_artifacts_container_repository" "unirepo" {
    compartment_id = oci_identity_compartment.compartment.compartment_id
    display_name = "unirepo"
    is_public = false
}

output "compartment_id" {
    value = oci_identity_compartment.compartment.compartment_id
}

output "subnet_id" {
    value = oci_core_subnet.subnet.id
}

output "unirepo_namespace" {
    value = oci_artifacts_container_repository.unirepo.namespace
}