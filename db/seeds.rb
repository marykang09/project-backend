# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#destroy all for every reseed
Pose.destroy_all
User.destroy_all
Sequence.destroy_all
SequencePose.destroy_all
Muscle.destroy_all
PoseMuscle.destroy_all
Quote.destroy_all
UserQuote.destroy_all

# poses data
data = File.read("#{Rails.root}/db/data/data.json")
poses_array = JSON.parse(data)

#poses
poses_array.each do |pose|
    Pose.create(
        english_name: pose["english_name"],
        sanskrit_name: pose["sanskrit_name"],
        img_url: pose["img_url"],
        muscle_identifer: pose["muscle_identifer"]
    )
end

#users
mary = User.create(username: "maryk", first_name: "Mary", last_name: "Kang", password: "password")

#sequences
sequence1 = Sequence.create(user: mary, name: "my first sequence", notes: "")
sequence2 = Sequence.create(user: mary, name: "my second sequence", notes: "")


#sequenceposes
SequencePose.create(sequence: sequence1, pose: Pose.first, position_num: 1)
SequencePose.create(sequence: sequence2, pose: Pose.first, position_num: 1)
SequencePose.create(sequence: sequence2, pose: Pose.last, position_num: 2)
SequencePose.create(sequence: sequence2, pose: Pose.all.sample, position_num: 3)
SequencePose.create(sequence: sequence2, pose: Pose.all.sample, position_num: 4)
SequencePose.create(sequence: sequence2, pose: Pose.all.sample, position_num: 5)
SequencePose.create(sequence: sequence2, pose: Pose.all.sample, position_num: 6)

#quotes
quote_data = File.read("#{Rails.root}/db/data/quotes.json")
quotes_array = JSON.parse(quote_data)


quotes_array.each do |quote|
    Quote.create(
        quote: quote["quote"],
        author: quote["author"]
    )
end

#userquotes
uq1 = UserQuote.create(user: User.first, quote: Quote.first)




#muscles
Muscle.create(name: "hips", benefits: "relives tensions")

#posemuscles
PoseMuscle.create(pose: Pose.first, muscle: Muscle.first)

