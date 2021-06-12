This project is just a requirement for our final project in our major subject
It uses QtQuick as its software application framework

To use this application you must do the following:
1. Open initialize_database.py
2. Under class `init_db` and function `create_schema`, match the host, user and password with the corresponding configurations in your server
3. Open the database.py file from classes folder
4. Under class `database` and function `connect`, match the host, user and password with the corresponding configurations in your server
5. Run the python file `initialize_database.py` to create the schema and the tables
6. Run the python file `main.py` to start the program

To create a student account you must do the following:
1. Click the create account button on the login page
2. Fill up the fields
3. Click the create button
4. Login using the account that have just created

To create an instructor account, you must do the following:
1. Press the keys ALT+. on the login page
2. Fill up the fields
3. Click the create button
4. Login using the account that have just created

To make an admin account, you must do the following:
1. Either use an already existing instructor account or create a new instructor account with the instructions above
2. Run the python file `admin_handling.py`
3. Double click the name of the instructor on the left side you wish to make it an admin
4. Close the program and run the python file `main.py`
5. Login using the account that have just turned into an admin

To demote an admin account back to an instructor account, you must do the following:
1. Run the python file `admin_handling.py`
2. Double click the name of the admin on the right side you wish to demote into an instructor
3. Close the program and run the python file `main.py`
4. Login using the account that have just demoted into an instructor
