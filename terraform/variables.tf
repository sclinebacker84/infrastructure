variable tenancy_ocid {
    type = string
}

variable terraform_bucket {
    type = string
}

variable region {
    type = string
}

variable compartment_name {
    type = string
    default = "Default"
}

variable compartment_description {
    type = string
    default = "Default"
}