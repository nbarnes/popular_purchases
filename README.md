
RUNNING
=======
This application uses the gem figaro to secure its environment variables. To run locally, you must follow these steps.
1. Create a new Rails secret key by running 'rake secret' in the root directory of the app.
2. Create a file named 'application.yml' in the /config directory.
3. In application.yml, create a single line of the form: `SECRET_KEY_BASE: secret_key_goes_here`
4. Cut and paste the generated key where indicated
5. Run the application with 'rails s'.
6. The application should be available locally as <http://localhost:3000>.

NOTES
=====
The user 'Morgan_Barton' demonstrates a potential limitation of the system as described in the requirements; specifically, he's bought two different items twice each in his last 5 purchases. Per a reading of the requirements, '5 recent purchases' and 'for each purchase', this case did not receive special handling, but certainly could if the client wishes it.

Contrary to default Rails config, caching has been enabled in the development environment to demonstrate the functionality.

Tests may be run with 'rake test' at the command line.
