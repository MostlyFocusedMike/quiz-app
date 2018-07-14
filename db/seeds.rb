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

tom = User.create(username: "tom93", password: "1234")
angelica = User.create(username: "12_angel", password: "1234")
phil = User.create(username: "xxx_phil_xxx", password: "1234")
greg = User.create(username: "the_g_man", password: "1234")
arty = User.create(username: "the_artinator", password: "1234")
patty = User.create(username: "miss_pancake", password: "1234")
trogdor = User.create(username: "trog_the_burner", password: "1234")
sarah = User.create(username: "sarah_smasher", password: "1234")
caroline = User.create(username: "care_bear", password: "1234")

general = Topic.create(title: "General", description: "If you want to get all 20, you'll need to know a little of everything")
history = Topic.create(title: "History", description: "Events from ancient history to modern pop culture make this category tricky")
film = Topic.create(title: "Film", description: "If you want to play this topic, ask yourself a question: \"Do I feel lucky?\"")
tv = Topic.create(title: "TV", description: "All your binge watching has prepared you for this moment")
computers = Topic.create(title: "Computers", description: "A topic for nerds, BY nerds")

tom.scores.create(score: 2300, topic: general)
trogdor.scores.create(score: 2500, topic: general)
phil.scores.create(score: 1200, topic: general)
caroline.scores.create(score: 1000, topic: history)
trogdor.scores.create(score: 3900, topic: history)
patty.scores.create(score: 700, topic: history)
arty.scores.create(score: 1000, topic: film)
sarah.scores.create(score: 7900, topic: film)
caroline.scores.create(score: 0, topic: film)
greg.scores.create(score: 1000, topic: tv)
angelica.scores.create(score: 7900, topic: tv)
phil.scores.create(score: 0, topic: tv)
tom.scores.create(score: 1000, topic: computers)
patty.scores.create(score: 7900, topic: computers)
caroline.scores.create(score: 0, topic: computers)

def makeQuestions(data_hash) 
  topic = data_hash[:topic]
  topic_questions = JSON.parse(RestClient.get("https://opentdb.com/api.php?amount=50&category=#{data_hash[:cat_num]}&type=multiple"))["results"]
  topic_questions.each do |question|
    if (topic.questions.none? {|db_q| db_q[:question] == question["question"]})
      topic.questions.create(
        question: question["question"],
        correct_answer: question["correct_answer"],
        wrong1: question["incorrect_answers"][0],
        wrong2: question["incorrect_answers"][1],
        wrong3: question["incorrect_answers"][2]
      )
    end 
  end
end 

2.times do
  [
   {topic: general, cat_num: 9},
   {topic: history, cat_num: 22},
   {topic: computers, cat_num: 18},
   {topic: tv, cat_num: 14},
   {topic: film, cat_num: 11}
  ].each { |data| makeQuestions(data) }
end
