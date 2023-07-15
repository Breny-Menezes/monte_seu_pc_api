# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# Products available at Devise Informática and their due specifications to be inserted.

# PROCESSING UNITS
# Data Mapping
# Brands: Intel - 1 | AMD - 2
[
  {description: 'Core i5', brand: 1},
  {description: 'Core i7', brand: 1},
  {description: 'Ryzen 5', brand: 2},
  {description: 'Ryzen 7', brand: 2},
].each do |unit_data|
  ProcessingUnit.find_or_create_by(unit_data)
end

# MOTHERBOARDS
# Data Mapping
# Supported processing units: Intel - 1 | AMD - 2 | both - 3
[
  {description: 'Asus ROG', supported_processing_unit: 1, available_ram_slots: 2, max_ram_supported: 16, integrated_video_card: false},
  {description: 'Gigabyte Aorus', supported_processing_unit: 2, available_ram_slots: 2, max_ram_supported: 16, integrated_video_card: false},
  {description: 'ASRock Steel Legend', supported_processing_unit: 3, available_ram_slots: 4, max_ram_supported: 64, integrated_video_card: true}
].each do |motherboard_data|
  Motherboard.find_or_create_by!(motherboard_data)
end

# RAM Memory
[4, 8, 16, 32, 64].each do |memory_size|
  RamMemory.find_or_create_by(description: 'Kingston Hiper X', size: memory_size)
end

# VIDEO CARDS
[
  'Evga Geforce RTX 2060 6GB',
  'Asus ROG Strix Geforce RTX 3060 6GB',
  'Gigabyte Radeon RX 6600 XT EAGLE 8GB'
].each do |video_card|
  VideoCard.find_or_create_by(description: video_card)
end
