# db/seeds.rb

# Checks if the admin user exists to avoid creating it again
unless User.exists?(email: "admin@example.com")
  admin = User.create(
    name: "Admin User",
    email: "admin@example.com",
    password: "password"
  )
else
  admin = User.find_by(email: "admin@example.com")
  puts "Admin user already exists."
end

# Checks if the sample projects already exist
unless Project.exists?(title: "Website Redesign") && Project.exists?(title: "Mobile App Development")
  project1 = Project.create(
    title: "Website Redesign",
    description: "Complete overhaul of the company website with new branding and improved UX.",
    status: "In Progress"
  )

  project2 = Project.create(
    title: "Mobile App Development",
    description: "Develop a new mobile app for iOS and Android platforms.",
    status: "Not Started"
  )
else
  project1 = Project.find_by(title: "Website Redesign")
  project2 = Project.find_by(title: "Mobile App Development")
  puts "Sample projects already exist."
end

# Checks if the initial status changes have already been created
unless StatusChange.exists?(project: project1, from_status: "None", to_status: "In Progress")
  StatusChange.create(
    from_status: "None",
    to_status: "In Progress",
    reason: "Project initiated",
    user: admin,
    project: project1
  )
end

unless StatusChange.exists?(project: project2, from_status: "None", to_status: "Not Started")
  StatusChange.create(
    from_status: "None",
    to_status: "Not Started",
    reason: "Project created",
    user: admin,
    project: project2
  )
end

# Checks if the sample comments already exist
unless Comment.exists?(content: "Let's schedule a kickoff meeting with the design team.")
  Comment.create(
    content: "Let's schedule a kickoff meeting with the design team.",
    user: admin,
    project: project1
  )
end

unless Comment.exists?(content: "We need to define the scope and timeline more clearly.")
  Comment.create(
    content: "We need to define the scope and timeline more clearly.",
    user: admin,
    project: project2
  )
end
