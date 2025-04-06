admin = User.create(
  name: "Admin User",
  email: "admin@example.com",
  password: "password"
)

#  sample projects
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

# initial status changes
StatusChange.create(
  from_status: "None",
  to_status: "In Progress",
  reason: "Project initiated",
  user: admin,
  project: project1
)

StatusChange.create(
  from_status: "None",
  to_status: "Not Started",
  reason: "Project created",
  user: admin,
  project: project2
)

#  sample comments
Comment.create(
  content: "Let's schedule a kickoff meeting with the design team.",
  user: admin,
  project: project1
)

Comment.create(
  content: "We need to define the scope and timeline more clearly.",
  user: admin,
  project: project2
)
