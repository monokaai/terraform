# locals {
#   subnets = {
#   "app" = { az = "1a", cidr = "10.1.0.0/24", public = true }
#   "db"  = { az = "1c", cidr = "10.2.0.0/24", public = false }
# }
# users = {
#   "admin" = { name = "admin", role = "admin" }
#   "foo"   = { name = "foo", role = "user" }
#   "bar"   = { name = "bar", role = "user" }
# }
# }

# // サブネットのサンプル定義
# resource "subnet" "subnets" {
#   for_each = local.subnets
#   name     = each.key
#   az       = eavch.value.az
#   cidr     = eavch.value.cidr
#   public   = eavch.value.public
# }
