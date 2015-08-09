# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	User.create(username: 'admin', email: 'admin@red.ujaen.es', 
				name: 'Admin', password: '12345678', level: 0)
	User.create(username: 'mafc0004', email: 'mafc0004@red.ujaen.es', 
				name: 'Miguel Ángel', password: '12345678')
	User.create(username: 'dep00001', email: 'dep00001@red.ujaen.es', 
				name: 'Daniel', password: '12345678')
	User.create(username: 'prueba', email: 'prueba@prueba.com', 
				name: 'Prueba', password: '12345678')

	Post.create(content: 'Primer mensaje del sistema microblogging', user_id: 1)
	Post.create(content: 'Esto es mi trabajo final de grado', user_id: 2)


	
