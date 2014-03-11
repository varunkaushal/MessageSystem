MessageSystem
Auther: Varun Kaushal
Ver: 0.1 BETA
Date: 3/11/2014
email: varunkaushal@uchicago.edu
=============

Allows users to message other users and receive read receipts on sent messages


Application Functionality
=========================

Features that are currently implemented:
-GET POST PATCH DELETE Procedures
-User sign in and authentication
-Passwords with Bcrypt
-Session management
-Callbacks and validation
-Filters
-Migrated and Seeded DB
-Email functionality (The log shows that emails are sent to all newly created users, however there seems to be a firewall connection issue on some machines when actually delivering the email)

Usage
=====

Please Migrate DB and Seed with the supplied files

There are currently 4 pre-created users
user1
user2
user3
user4

password: password1
This is the preset password for all current users.

The inbox shows all messages that the user received.
The outbox shows all messsages that the user has sent.
New message allows the user to send a message to another user, or a group.
-If a group name is put in, then all users in that group receive the message.

MyProfile shows the current users information and allows the user to join a group.
-If a group doesn't exist, it is created and the user joins that new group.

All messages in the inbox initially appear as unread.
-Clicking on a message link takes you to the details of that message
-Unread messages have an Acknoledge button.  When clicked both the receiver and the sender have a marker on that message stating it has been read.

Enjoy using this rudimentary Messaging Service.