RUNNING
=======

This application uses the gem figaro to secure its environment variables. To run locally, you must follow these steps.
1. Create a new Rails secret key by running 'rake secret' in the root directory of the app.
2. Create a file named 'application.yml' in the /config directory.
3. In application.yml, create a single line of the form: `SECRET_KEY_BASE: secret_key_goes_here`
4. Cut and paste the generated key where indicated and run the application with 'rails s'.
5. The application should be available locally as <http://localhost:3000>.
