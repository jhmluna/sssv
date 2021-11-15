# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Database cleanup started."
puts "..."
Request.destroy_all
User.destroy_all
puts "Database was cleaned!"

puts "Seeding started."
print "."
# Users
citizen1 = User.create!(full_name: 'John Snow', email: 'citizen1@gmail.com', password: '123456',
                        address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.cell_phone,
                        cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true))
print "."
citizen2 = User.create!(full_name: 'Daenerys Targaryen', email: 'citizen2@gmail.com', password: '123456',
                        address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.cell_phone,
                        cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true))
print "."
citizen3 = User.create!(full_name: 'Eddard "Ned" Stark', email: 'citizen3@gmail.com', password: '123456',
                        address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.cell_phone,
                        cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true))
print "."
citizen4 = User.create!(full_name: 'Robert Baratheon', email: 'citizen4@gmail.com', password: '123456',
                        address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.cell_phone,
                        cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true))
print "."
tech_mt = User.create!(full_name: 'Tyrion Lannister', email: 'tech_mt@gmail.com', password: '123456',
                       cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
                       role: 'tech', location: 'Mato Grosso')
tech_mg = User.create!(full_name: 'Sandor Clegane', email: 'tech_mg@gmail.com', password: '123456',
                       cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
                       role: 'tech', location: 'Minas Gerais')
tech_rj = User.create!(full_name: 'Khal Drogo', email: 'tech_rj@gmail.com', password: '123456',
                       cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
                       role: 'tech', location: 'Rio de Janeiro')
tech_mt2 = User.create!(full_name: 'Augusto Mendonça', email: 'augustoapo@gmail.com', password: '123456',
                        cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
                        role: 'tech', location: 'Mato Grosso')
manager = User.create!(full_name: 'Stannis Baratheon', email: 'manager@gmail.com', password: '123456',
                       cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
                       role: 'manager', location: 'Rio de Janeiro')
print "."

# Requests
# Mato Grosso
Request.create!(instrument: 'Medidor de Água', service: 'Verificação', citizen: citizen1,
                location: 'Mato Grosso', description: 'Serviço de verificação do medidor de água')
Request.create!(instrument: 'Medidor de Gás', service: 'Verificação', citizen: citizen2,
                location: 'Mato Grosso', description: 'Serviço de verificação do medidor de gás')
Request.create!(instrument: 'Medidor de Energia Elétrica', status: 'Em andamento', service: 'Perícia', citizen: citizen3,
                tech: tech_mt, location: 'Mato Grosso', description: 'Serviço de perícia do medidor de energia elétrica')
Request.create!(instrument: 'Medidor de Água', service: 'Perícia', citizen: citizen4,
                location: 'Mato Grosso', description: 'Serviço de perícia do medidor de energia elétrica')
print "."

# Minas Gerais
Request.create!(instrument: 'Medidor de Gás', service: 'Verificação', citizen: citizen1,
                location: 'Minas Gerais', description: 'Serviço de verificação do medidor de gás')
Request.create!(instrument: 'Medidor de Água', status: 'Em andamento', service: 'Verificação',
                citizen: citizen2, tech: tech_mg, location: 'Minas Gerais', description: 'Serviço de verificação do medidor de água')
Request.create!(instrument: 'Medidor de Energia Elétrica', service: 'Perícia', citizen: tech_mg,
                location: 'Minas Gerais', description: 'Serviço de perícia do medidor de energia elétrica')
Request.create!(instrument: 'Medidor de Água', service: 'Perícia', citizen: citizen4,
                location: 'Minas Gerais', description: 'Serviço de perícia do medidor de energia elétrica')
print "."

# Rio de Janeiro
Request.create!(instrument: 'Medidor de Gás', service: 'Verificação', citizen: citizen1,
                location: 'Rio de Janeiro', description: 'Serviço de verificação do medidor de gás')
Request.create!(instrument: 'Medidor de Energia Elétrica', status: 'Em andamento', service: 'Perícia',
                citizen: citizen2, tech: tech_rj, location: 'Rio de Janeiro', description: 'Serviço de perícia do medidor de energia elétrica')
Request.create!(instrument: 'Medidor de Água', service: 'Verificação', citizen: citizen3,
                location: 'Rio de Janeiro', description: 'Serviço de verificação do medidor de água')
Request.create!(instrument: 'Medidor de Água', service: 'Perícia', citizen: citizen4,
                location: 'Minas Gerais', description: 'Serviço de perícia do medidor de energia elétrica')
puts "."
puts "Seed completed!"
