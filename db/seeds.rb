# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

teachers = [
    {
        email: "Wilgoss@unsw.com", user_name: "Prof Wilgoss", role: 2, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Kupatiputia@unsw.com", user_name: "Prof Kupatiputia", role: 2, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Kopaliski@unsw.com", user_name: "Prof Kopaliski", role: 2, password: '123456', password_confirmation: '123456'
    }
]

students = [
    {
        email: "Alan@unsw.com",user_name: "Alan Bond", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Bernie@unsw.com",user_name: "Bernie Eck", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Charlie@unsw.com",user_name: "Charlie Chaplin", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "David@unsw.com",user_name: "David Backhand", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Elon@unsw.com", user_name: "Elon Timeago", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Freddy@unsw.com", user_name: "Freddy Teddy", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Greg@unsw.com", user_name: "Greg Moreman", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Henry@unsw.com",user_name: "Henry DeAteh", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Indiana@unsw.com",user_name: "Indiana Jones", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "John@unsw.com",user_name: "John Wayne", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Kevin@unsw.com",user_name: "Kevin BackCone", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Lisa@unsw.com",user_name: "Lisa Little", role: 1, password: '123456',password_confirmation: '123456'
    },
    {
        email: "Marco@unsw.com",user_name: "Marco Polo", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Nile@unsw.com",user_name: "Nile MileRiver",role:1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Oliver@unsw.com",user_name: "Oliver Twist", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Peter@unsw.com",user_name: "Peter Pan", role: 1, password: '123456',password_confirmation:'123456'
    },
    {
        email: "Quick@unsw.com",user_name: "Qick IsaTrik", role: 1,password: '123456', password_confirmation:'123456'
    },
    {
        email: "Ronald@unsw.com",user_name: "Rondal Mac", role:1,password: '123456',password_confirmation: '123456'
    },
    {
        email: "Steven@unsw.com",user_name: "Steven StealBurger", role:1,password: '123456',password_confirmation:'123456'
    },
    {
        email: "Tony@unsw.com",user_name: "Fat Tony", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Uki@unsw.com",user_name: "Uki saynomore", role:1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Viki@unsw.com",user_name: "Viki Viking", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "William@unsw.com",user_name:"William Wonka",role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Xane@unsw.com",user_name:"Xane Insane", role: 1, password: '123456', password_confirmation:'123456'
    },
    {
        email: "Yoko@unsw.com",user_name:"Yoko Ohnoway", role: 1, password: '123456', password_confirmation: '123456'
    },
    {
        email: "Zack@unsw.com",user_name:"Zack Ephwrong", role: 1, password: '123456',password_confirmation: '123456'
    }
]

courses = [
    {
        name: "Mechanical Engineering 2021", description: "TAFE practical lab 2021", year: 2021,month: 6, active: false, user_id: 33
    },
    {
        name: "Mechatronic Engineering 2021", description: "TAFE Robotics lab 2021", year: 2021,month: 6, active: false, user_id: 33
    },
    {
        name: "Naval Engineering 2021 ", description: "Sail around Sydney Harbour 2021", year: 2021,month: 1, active: false, user_id:33
    },
    {
        name: "Mechanical Engineering 2022", description: "TAFE practical lab 2022", year: 2022,month: 6, active: true, user_id: 33
    },
    {
        name: "Mechatronic Engineering 2022", description: "TAFE Robotics lab 2022", year: 2022,month: 6, active: true, user_id: 33
    },
    {
        name: "Naval Engineering 2022", description: "Sail around Sydney Harbour 2022", year: 2022,month: 1, active: true, user_id:33
    }
]

excusrions = [
    {
        name: ""
    }

]

#User.create(teachers)
#User.create(students)

# Course ***
# Find teachers ID (user_id) and insert into the data
# then course create.

courses.each do |course|
    teacher = User.where(unser_name: "Prof Wilgoss")
    course[:user_id] = teacher.id.to_i
    course.create(course)
end
#Course.create(courses)

