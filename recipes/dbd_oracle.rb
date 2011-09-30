#
# Cookbook Name:: perl
# Recipe:: dbd_oracle
#
# Copyright 2010, NREL
#
# All rights reserved - Do Not Redistribute
#

include_recipe "perl::dbi"
include_recipe "oracle_instantclient"

dependencies = value_for_platform({
  ["redhat", "centos", "fedora"] => { "default" => ["perl-Test-Simple"] },
  "default" => { "default" => [] },
})

dependencies.each do |package_name|
  package package_name
end

cpan_module "DBD::Oracle" do
  # Tests fail, since it can't connect to a dummy Oracle database, but we don't care.
  force true

  environment({
    "LD_LIBRARY_PATH" => node[:oracle_instantclient][:path],

    # LD_RUN_PATH seems to be needed for DBD::Oracle to work through Apache on
    # Redhat.
    "LD_RUN_PATH" => node[:oracle_instantclient][:path],
  })
end
