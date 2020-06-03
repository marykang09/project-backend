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

#sequenceposes
SequencePose.create(sequence_id: 1, pose_id: 1, position_num: 1)

#muscles
Muscle.create(name: "hips", benefits: "relives tensions")

#posemuscles
PoseMuscle.create(pose_id: 1, muscle_id: 1)

