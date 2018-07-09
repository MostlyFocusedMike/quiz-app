# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

User.destroy_all
Score.destroy_all
Topic.destroy_all
Question.destroy_all

tom = User.create(name: "tom", password: "1234")
angelica = User.create(name: "angelica", password: "1234")
phil = User.create(name: "phil", password: "1234")

general = Topic.create(title: "General", description: "Stuff and whatnot")
animals = Topic.create(title: "Animals", description: "Animals are neat")

tom.scores.create(score: 1000, topic: general)
angelica.scores.create(score: 7900, topic: general)
phil.scores.create(score: 0, topic: general)
tom.scores.create(score: 1000, topic: animals)
angelica.scores.create(score: 7900, topic: animals)
phil.scores.create(score: 0, topic: animals)

# q1 = computers.questions.create(question: "q1", correct_answer: "c1", wrong1: "w1", wrong2: "w2", wrong3: "w3")
# q2 = animals.questions.create(question: "q2", correct_answer: "c2", wrong1: "w4", wrong2: "w5", wrong3: "w6")


data = JSON.parse(RestClient.get('https://opentdb.com/api.php?amount=20&category=9&type=multiple'))["results"]

data.each do |question|
  general.questions.create(
    question: question["question"],
    correct_answer: question["correct_answer"],
    wrong1: question["incorrect_answers"][0],
    wrong2: question["incorrect_answers"][1],
    wrong3: question["incorrect_answers"][2]
  )
end
