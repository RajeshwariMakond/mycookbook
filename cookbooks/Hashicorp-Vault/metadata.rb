name 'REAN-vault'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures REAN-vault'
long_description 'Installs/Configures REAN-vault'
version '0.1.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/reancloud/REAN-vault/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/reancloud/REAN-vault' if respond_to?(:source_url)

depends 'mysql2_chef_gem', '~> 2.0.1'
depends 'mysql', '~> 8.3.0'
depends 'database', '~> 6.1.1'
depends 'unzip', '~> 0.0.1'
depends 'ark', '~> 2.2.1'
