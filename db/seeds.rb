# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
#....
Product.create(:title=>'Book of Ruby',
	:description=>
	 %{Standard book for the beginner of ruby language. },
	:image_url=>'/images/ruby.png',
	:price=>30)
Product.create(:title=>'Architecture',
	:description=>
	 %{My final Architecture. },
	:image_url=>'/images/arc.png',
	:price=>45)
Product.create(:title=>'Rails',
	:description=>
	 %{New Rails Book. },
	:image_url=>'/images/Rails.png',
	:price=>50)
