# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# create 10 organizations
# each organization has a random number(from  1 to 20)
# of projects
FactoryGirl.create_list(:organization_with_projects, 10, project_count: ->{ rand(1..20) } )

10.times do
	# create a random list of developers (from 1 to 10)
	# and associate them to a random sample of 1 to 20 projects
	FactoryGirl.create_list(:developer_with_projects, rand(1..10), associated_projects: ->{ Project.all.sample(rand(1..20)) } )
end

Project.all.each do |proj|
  proj.update(status: rand(3))
end

Organization.all.each do |org|
  org.update(password: "password")
end
