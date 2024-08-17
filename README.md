# Coding Club Backend Guidelines

## Installation
- Fork the repo from the master/main branch.
- Navigate to the repo location on your device.
- Use "git clone - forked_Link"
- Install the necessary packages and dependencies using "npm install"
- DB connection key and other private things will be shared explicitly on Discord.

## Contributing
- To add your changes, you need to follow these steps :
    - Create a branch ( Name of the branch should be "YOUR_NAME-BACKEND-ISSUE" )
    - Commit your changes. The commit message should be addressing the cause of change.
    - Push the changes.
    - Open Github and create a new Pull Request which will be then reviewed and merged.

## Folder Structure and Naming Convention
- Name of ecah file will be in camel case.
- About folder structure :
    - Try to keep the code as modular as possible as it will help to debug easily.
    - Try to reuse the code wherever possible.
    - The entire folder strucutre of the backend will be divided as:
      - Controllers : To hold the REST APIs.
      - Services : Here We'll write our functions and logics to get desired results.
      - Models : Here We'll define our database schemas.
    
## Tips
- Always take a fresh pull from the master/main before starting your work to resolve the issue of merge conflicts.

## Feel free to add more valuable points here.