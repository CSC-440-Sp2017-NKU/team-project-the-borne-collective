# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
borne = User.create!(name: "Borne", email: "borne@collective.com",    password: "foobar", password_confirmation: "foobar", admin: true)
jessee = User.create(name: "jessee",email: "jesseemeadows@gmail.com", password: "foobar", password_confirmation: "foobar", registrar: true)
tut = User.create(name: "example",email: "example@railstutorial.org", password: "foobar", password_confirmation: "foobar")

csc440 = Course.create(name: "CSC 440: Software Engineering", description: "A course in Rails", titleline: "Taught by Tim McCord")
csc439 = Course.create(name: "CSC 439: Software Testing",           description: "A course in Rails", titleline: "Taught by Tim McCord")
Course.create(name: "CSC 460: Operating Systems",                   description: "A course in Rails", titleline: "Taught by Tim McCord")
Course.create(name: "CSC 402: Advanced Programming Methods",        description: "A course in Rails", titleline: "Taught by Tim McCord")
Course.create(name: "CSC 364: Data structures and Alogorithms",     description: "A course in Rails", titleline: "Taught by Tim McCord")
Course.create(name: "CSC 362: Compute Systems",     description: "A course in Rails", titleline: "Taught by Tim McCord")
Course.create(name: "CSC 360: Object Oriented Programming II",     description: "A course in Rails", titleline: "Taught by Tim McCord")
Course.create(name: "CSC 260: Object Oriented Programming I",     description: "A course in Rails", titleline: "Taught by Tim McCord")



post_j  = Post.create(content: "Sample Post One from Jesseee", title: "Title of Sample Post One from Jessee", user_id: jessee.id, course_id: csc440.id)
post_j2 = Post.create(content: "Sample Post two from Jesseee", title: "Title of Sample Post two from Jessee", user_id: jessee.id, course_id: csc440.id)
post_j3 = Post.create(content: "Sample Post thress from Jesseee", title: "Title of Sample Post three from Jessee", user_id: jessee.id, course_id: csc440.id)

reply_b = Reply.create(content: "First reply on Jessee's first post", post_id: post_j.id, user_id: borne.id)
reply_b2 = Reply.create(content: "Second reply on Jessee's first post", post_id: post_j.id, user_id: borne.id)
reply_b3 = Reply.create(content: "Third reply on Jessee's first post", post_id: post_j.id, user_id: borne.id)

reply_b4 = Reply.create(content: "First reply on Jessee's second post", post_id: post_j2.id, user_id: borne.id)
reply_b5 = Reply.create(content: "Second reply on Jessee's second post", post_id: post_j2.id, user_id: borne.id)
reply_b6 = Reply.create(content: "Third reply on Jessee's second post", post_id: post_j2.id, user_id: borne.id)

reply_b7 = Reply.create(content: "First reply on Jessee's third post", post_id: post_j3.id, user_id: borne.id)
reply_b8 = Reply.create(content: "Second reply on Jessee's third post", post_id: post_j3.id, user_id: borne.id)
reply_b9 = Reply.create(content: "Third reply on Jessee's third post", post_id: post_j3.id, user_id: borne.id)

CourseRecord.create(user_id: jessee.id, course_id: csc440.id, status: "completed")
CourseRecord.create(user_id: jessee.id, course_id: csc439.id, status: "enrolled")

CourseRecord.create(user_id: borne.id, course_id: csc440.id, status: "teaching")
CourseRecord.create(user_id: borne.id, course_id: csc439.id, status: "taught")



