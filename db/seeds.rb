# db/seeds.rb

# Create some users
users = User.create!([
                       { name: "John Doe", email: "john@example.com", time_zone: "Europe/Vienna" },
                       { name: "Jane Smith", email: "jane@example.com", time_zone: "America/New_York" },
                       { name: "Alice Johnson", email: "alice@example.com", time_zone: "Asia/Tokyo" }
                     ])

# Create some tickets for the users
Ticket.create!([
                 { title: "Fix bug in production", description: "Critical bug affecting all users", due_date: Date.today + 5, status: :to_do, user: users[0] },
                 { title: "Prepare release notes", description: "Release notes for version 2.0", due_date: Date.today + 7, status: :in_progress, user: users[1] },
                 { title: "Update documentation", description: "Add new features to the documentation", due_date: Date.today + 10, status: :done, user: users[2] }
               ])

puts "Seed data created!"
