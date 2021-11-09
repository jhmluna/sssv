# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Database cleanup started."
puts "..."
Request.destroy_all
User.destroy_all
puts "Database was cleaned!"

puts "Seeding started."
puts "..."
# Users
citizen1 = User.create!(full_name: 'John Snow', email: 'citizen1@gmail.com', password: '123456')
citizen2 = User.create!(full_name: 'Daenerys Targaryen', email: 'citizen2@gmail.com', password: '123456')
citizen3 = User.create!(full_name: 'Cidadão Instigado', email: 'citizen3@gmail.com', password: '123456')
citizen4 = User.create!(full_name: 'Citizen Irritado', email: 'citizen4@gmail.com', password: '123456')
tech_mt = User.create!(full_name: 'Tyrion Lannister', email: 'tech-mt@gmail.com', password: '123456', role: 'tech', location: 'Mato Grosso')
tech_mg = User.create!(full_name: 'Servidor Atarefado', email: 'tech-mg@gmail.com', password: '123456', role: 'tech', location: 'Minas Gerais')
tech_rj = User.create!(full_name: 'Tech Irritado', email: 'tech-rj@gmail.com', password: '123456', role: 'tech', location: 'Rio de Janeiro')
tech_mt2 = User.create!(full_name: 'Augusto Mendonça', email: 'augustoapo@gmail.com', password: '123456', role: 'tech', location: 'Mato Grosso')
manager = User.create!(full_name: 'Gerente Irritado', email: 'manager@gmail.com', password: '123456', role: 'manager', location: 'Rio de Janeiro')

# Requests
Request.create!(instrument: 'Medidor de Água', service: 'Verification', citizen: citizen1, location: 'Mato Grosso', description: 'Serviço de verificação do medidor de água')
Request.create!(instrument: 'Medidor de Gás', service: 'Verification', citizen: citizen1, location: 'Mato Grosso', description: 'Serviço de verificação do medidor de gás')
Request.create!(instrument: 'Medidor de Energia Elétrica', status: 'Em andamento', service: 'Expertise', citizen: citizen2, tech: tech_mt, location: 'Mato Grosso', description: 'Serviço de perícia do medidor de energia elétrica')
Request.create!(instrument: 'Medidor de Gás', service: 'Verification', citizen: citizen3, location: 'Minas Gerais', description: 'Serviço de verificação do medidor de gás')
Request.create!(instrument: 'Medidor de Água', status: 'Em andamento', service: 'Verification', citizen: citizen3, tech: tech_mg, location: 'Minas Gerais',  description: 'Serviço de verificação do medidor de água')
Request.create!(instrument: 'Medidor de Energia Elétrica', service: 'Expertise', citizen: tech_mg, location: 'Minas Gerais', description: 'Serviço de perícia do medidor de energia elétrica')
Request.create!(instrument: 'Medidor de Gás', service: 'Verification', citizen: citizen3, location: 'Rio de Janeiro', description: 'Serviço de verificação do medidor de gás')
Request.create!(instrument: 'Medidor de Energia Elétrica', status: 'Em andamento', service: 'Expertise', citizen: citizen3, tech: tech_rj, location: 'Rio de Janeiro', description: 'Serviço de perícia do medidor de energia elétrica')
Request.create!(instrument: 'Medidor de Água', service: 'Verification', citizen: citizen3, location: 'Rio de Janeiro', description: 'Serviço de verificação do medidor de água')
puts "Seed completed!"
