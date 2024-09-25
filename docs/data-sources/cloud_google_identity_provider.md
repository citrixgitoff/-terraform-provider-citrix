---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "citrix_cloud_google_identity_provider Data Source - citrix"
subcategory: "Citrix Cloud"
description: |-
  Data Source of a Citrix Cloud Google Cloud Identity Provider instance. Note that this feature is in Tech Preview.
---

# citrix_cloud_google_identity_provider (Data Source)

Data Source of a Citrix Cloud Google Cloud Identity Provider instance. Note that this feature is in Tech Preview.

## Example Usage

```terraform
# Get Citrix Cloud Google Identity Provider data source by ID
data "citrix_cloud_google_identity_provider" "example_google_identity_provider" {
  id = "00000000-0000-0000-0000-000000000000"
}

# Get Citrix Cloud Google Identity Provider data source by name
data "citrix_cloud_google_identity_provider" "example_google_identity_provider" {
  name = "exampleGoogleIdentityProvider"
}
```

<!-- schema generated by tfplugindocs -->
## Schema

### Optional

- `id` (String) ID of the Citrix Cloud Google Cloud Identity Provider instance.
- `name` (String) Name of the Citrix Cloud Google Cloud Identity Provider instance.

### Read-Only

- `auth_domain_name` (String) User authentication domain name for Google Cloud Identity Provider.
- `google_customer_id` (String) Customer ID of the configured  Google Cloud Identity Provider.
- `google_domain` (String) Domain of the configured Google Cloud Identity Provider.