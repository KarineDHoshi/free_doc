# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

20.times do
    city = City.create!(
      name: Faker::Address.city)
  end

10.times do 
  Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,zip_code: Faker::Address.zip_code)
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

10.times do
  Appointment.create(date: Faker::Date.forward(days: 31), doctor_id: Doctor.all.sample.id, patient_id: Patient.all.sample.id)
end

Specialty.create!(specialty: "chirurgien")
Specialty.create!(specialty: "generaliste")
Specialty.create!(specialty: "infirmier")
Specialty.create!(specialty: "dentist")
Specialty.create!(specialty: "gyneco") 




20.times do
    join = JoinTableSpecialty.create!(doctor: Doctor.all.select(:id).sample, specialty: Specialty.all.select(:id).sample)
  end
  