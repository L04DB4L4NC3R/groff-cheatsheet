.de BL
.IP \(bu
..

.TL 
Java Programming Digital Assignment
.AU 
Angad Sharma, 17BCE2009
.AI
Vellore Institute of Technology, Vellore
.ND 
16/09/2020
.AB
In this digital assignment we will be looking at the design and procedure involved while making a Java FX login and signup application along with a functional backend for the same.
.AE
.2C
.SH
Spring Boot Backend Procedure
.LP
For the purpose of creating a backend we will be using sprint boot via the spring boot initializer.
.PP
Our backend needs to have the following features
.BL
Signup User
.BL
Login User
.PP
In this section we will be talking about how to implement login and signup in the backend.
.NH 1
Signup Functionality
.PP
Using spring boot initializer select the database and the web addon for the most recent version of spring boot to get started.
The signup procedure following the following strict heirarchy
.NH 2
Database implementations required
.QP
The following database functions are required for signup.
.BL
Saving a user record for creating an entry
.BL
Searching a user record to see if it already exists or not
.NH 2
Procedure
.PP
We take in user email and password from the payload and serialize it to JSON. We subsequently check if a user of the particular email exists in our database or not. If indeed such a user exists then we return that the user already exists hence signup cannot be completed.

If a user is not present in the database then we move on to hash the user provided password using a strong hashing algorithm, ideally using bcrypt. Md5 hashing is not recommended for this use case. A bcrypt hash digest is generated from the number of salt rounds provided by the environment variables and subsequently the email and hashed password entry is stored in the database.

After this is done, we serialize the user ID into a JSON Web Token (JWT) using a suitable encryption algorithm and provide it to the frontend as a JSON response payload.

.NH 2
Input and Output parameters
.PP
Input parameters
.QP
.BX "email: String"
.BX "password: String"
.PP
Output parameters
.QP
.BX "jwt: String"
.BX "statusCode: 201"

.NH 1
Login Functionality
.PP
While logging in, the user sends a password along with their email, which is then verified on the backend side and then the user is issued a JSON Web Token to make authorized calls to which the user can directly be related to.
.NH 2
Database implementations required
.QP
The following database implementations are required
.BL
User search by email is the only database functionality we require in this case
.NH 2
Procedure
.PP
When the user logs in, they send their email and password. We need to use the search by email functionality which we will define in our database repository implementation. Note that the password saved in the backend is hashed, so we need to hash the user provided password using the same algorithm and the number of salt rounds. After doing so, a direct comparison of the two password (namely the one fetched from the database and the one hashed on the user provided input) can reveal if user has entered the password correctly.

If indeed the password is correct then we need to serialize user ID into a JSON Web Token by encrypting it with a known algorithm and send it to the client as a JSON.

If the user has entered the password incorrectly then we need to return that the user is unauthorized. 
.B "HTTP status code 401"
can be used for this purpose.

.NH 2
Input and Output parameters
.PP
Input parameters
.QP
.BX "email: String"
.BX "password: String"
.PP
Output parameters
.QP
.BX "jwt: String"
.BX "statusCode: 200"

.NH 1
The MVC architecture for our application
.PP
Our application will use the model-view-controller architecture with our spring boot application. 
.NH 2
Model
.PP
Model referes to our database layer, which includes
.BL
Creating entities (classes to be saved)
.BL
Creating repository interfaces
.BL
Using repository interfaces to create services which will be called from other layers
.NH 2
Controller
.PP
The controller layer referes to the services which use repository functions to implement business logic. They will be used as a way to link model with the views. They are like a black box between what needs to be implemented using user input and what is indeed implemented in the form of server state
.NH 2
View
.PP
The view layer is the user interface that any client side applications will interact with. It is responsible for serializing user input into classes and passing them to the correct controllers as well as serializing controller output data in the form of JSON to be shared with the client side application.
