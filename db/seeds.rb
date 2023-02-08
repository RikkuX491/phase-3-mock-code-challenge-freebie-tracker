puts "Creating companies..."
Company.create(name: "Google", founding_year: 1998)
Company.create(name: "Facebook", founding_year: 2004)
Company.create(name: "Dunder Mifflin", founding_year: 2002)
Company.create(name: "Enron", founding_year: 1995)

puts "Creating devs..."
Dev.create(name: "Rick")
Dev.create(name: "Morty")
Dev.create(name: "Mr. Meseeks")
Dev.create(name: "Gazorpazop")

puts "Creating freebies..."

# ***************************************************************
# * TODO: create freebies! Remember, a freebie belongs to a dev *
# * and a freebie belongs to a company.                         *
# ***************************************************************
# Create freebies Here

item_names = ["Water Bottle", "Sticker", "T-shirt", "Sweater", "Pen", "Beach Ball", "Drawstring Bag", "Coffee Cup"]
values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

8.times do
    Freebie.create(company_id: Company.all.sample.id, dev_id: Dev.all.sample.id, item_name: item_names.sample, value: values.sample)
end

puts "Seeding done!"
