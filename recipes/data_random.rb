#
# Cookbook Name:: perl
# Recipe:: data_random
#
# Copyright 2011, NREL
#
# All rights reserved - Do Not Redistribute
#

include_recipe "perl"

package "perl-YAML"
package "perl-Test-Simple"
cpan_module "Data::Random"
