# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

aclu = Organization.create(
	name: "ACLU", 
	description: "The ACLU is our nation's guardian of liberty, working daily in courts, legislatures and communities to defend and preserve the individual rights and liberties that the Constitution and laws of the United States guarantee everyone in this country.",
	url: "www.aclu.org",
	email: "info@aclu.org",
	password: "acluaclu")

petition = Project.create(
	title: 'Petition against Hobby Lobby',
	repository: 'github.com/hobby_lobby_petition',
	description: 'Sign the card to David Green, CEO of Hobby Lobby, letting him know we won’t be shopping anywhere where a boss tries to block employees’ health coverage for contraception.',
	status: 'requested'
	)

aclu.projects << petition

stop_frisk = Project.create(
	title: 'Stop and frisk database',
	repository: 'github.com/stop_frisk',
	description: 'This database organizes data from NYPD stop and frisks. The New York City Police Department (NYPD) has stopped and frisked over five million people since Mayor Bloomberg took over, more than 4.3 million of them Black and Latino. Each year, the NYPD makes tens of thousands of arrests for low-level offenses and hands out over a half million summonses—all of which can come with severe enmeshed penalties. - See more at: http://www.bronxdefenders.org/our-work/policy-community-development/#sthash.HdbcD7dE.dpuf',
	status: 'requested')

aclu.projects << stop_frisk

bronx_defenders = Organization.create(
	name: 'Bronx Defenders',
	description: 'The Bronx Defenders provides innovative, holistic, and client-centered criminal defense, family defense, civil legal services, social work support and advocacy to indigent people of the Bronx. Today, our staff of over 200 represents 35,000 individuals each year and reaches hundreds more through outreach programs and community legal education. In the Bronx and beyond, The Bronx Defenders promotes justice in low-income communities by keeping families together. - See more at: http://www.bronxdefenders.org/who-we-are/#sthash.CnsEg52I.dpuf',
	url: 'http://www.bronxdefenders.org/',
	email: 'info@bronxdefenders.org',
	password: 'bronxdefenders')

bd_site = Project.create(
	title: 'Bronx Defenders website',
	repository: 'github.com/bronx_defenders',
	description: 'A sweet new website for the Bronx Defenders',
	status: 'requested')

bronx_defenders.projects << bd_site