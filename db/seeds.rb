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
	User.create(username: 'prueba', email: 'prueba@red.ujaen.es', 
				name: 'Prueba', password: '12345678')

	Post.create(content: 'Primer mensaje del sistema microblogging', user_id: 1)
	Post.create(content: 'Este es mi trabajo final de grado', user_id: 2)
	Post.create(content: 'Los mensajes de profesores y administración será de este color, mientras que el de los alumnos será de color gris', user_id: 1)
	Post.create(content: 'Las pruebas funcionan bien', user_id: 3)	
	Post.create(content: 'Todo listo para el despliege en heroku', user_id: 2)


	Group.create(name: 'Organización y gestión de empresas', tag: '#OGE', description: 'Grupo de teoría de mañana', user_admin: 1)
	Group.create(name: 'Programación orientada a objetos', tag: '#POO', description: 'Grupo de práctica 10:30-12:30', user_admin: 1)
	Group.create(name: 'Tecnologías basadas en la web', tag: '#TECNOWEB', description: 'Grupo de teoría de mañana', user_admin: 1)

	Membership.create(user_id: 2, group_id: 2)
	Membership.create(user_id: 2, group_id: 3)

	Membership.create(user_id: 3, group_id: 2)
	Membership.create(user_id: 3, group_id: 3)

	Relationship.create(follower_id: 2, followed_id: 1)

	Post.create(content: 'Mañana empiezan las clases de #POO', user_id: 1)
	Post.create(content: 'Probando el grupo de #TECNOWEB ', user_id: 1)
	Post.create(content: 'No me gustan las clases de #OGE ', user_id: 2)
	Post.create(content: 'Aburridas clases de #OGE', user_id: 3)

	Tag.create(post_id: 6, group_id: 2)
	Tag.create(post_id: 7, group_id: 3)
	Tag.create(post_id: 8, group_id: 1)
	Tag.create(post_id: 9, group_id: 1)










	




	
