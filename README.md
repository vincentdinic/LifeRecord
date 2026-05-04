# LifeRecord

A web-based family management & document organization tool

**Features**
- Family member management
- Financial account management
- Family calendar with user-scoped events
- Property & vehicle management
- Polymorphic document storage on these records

**Setup (Ubuntu)**
1. Download rbenv
2. Add rbenv to your .bashrc
3. Install ruby and rails
    - rbenv install 3.4.7
    - gem install rails 8.1.2
4. cd into the repo
5. bundle install
6. yarn install
7. bin/rails db:reset (seed the database)
8. bin/dev (to start a local server)
