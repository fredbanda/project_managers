# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Questions I Would Ask and anticipated answers:

1. What information should we store about a project besides comments and status?
        A: For now, just track project title and description. We can expand later.
2. What are the possible status values for a project?
        A: The statuses should be: "Not Started", "In Progress", "On Hold", "Completed".
3. Should users be authenticated to leave comments, or can anyone comment?
        A: Only authenticated users can leave comments.
4.     Do we need user profiles/accounts for the comment system?
        A: Keep it simple - just use a basic user model with name and email.
5. Is there any specific UI design or styling requirements?
        A: Clean, minimal UI is fine. No need for fancy design in this prototype.
6. Should comments support rich text, attachments, or just plain text?
        A: Plain text comments are sufficient for now.
7. Do we need comment threading/replies or just flat comments?
        A: Flat comments are fine for this MVP.
8. Should status changes include a reason or description?
        A: Yes, a reason for status change would be helpful for tracking.
9. Are there any performance concerns or expected volume of comments/projects?
        A: This is just a prototype, so no need to worry about scale yet.
10. Should we implement any notifications when status changes or comments are added?
        A: No notifications needed for this version.