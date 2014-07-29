# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# build 10 organizations
# each organization has 50 projects
# for each project, one developer is created, 
# who joins a list of randomly selected projects
FactoryGirl.create_list(:organization_with_projects, 10, count: 50, developers: true )

