# SLAM - Sports-Oriented Twitter Simulation


## Introduction
Welcome to SLAM, a sports-oriented Twitter simulation where users can stay updated on the latest sports news, engage in discussions, and connect with like-minded enthusiasts. Our aim is to provide a reliable source of information on favorite teams and athletes while fostering a dynamic community of sports enthusiasts.

## Type of Users
SLAM accommodates three types of users: registered, anonymous, and administrators. Each user type has access to specific functionalities based on their role. Check out the use case diagram for a detailed overview of the available functionalities.

## Architectural Pattern - MVC
SLAM follows the Model-View-Controller (MVC) architectural pattern to effectively organize and structure the application. The MVC pattern separates the application into three components:

Model: Represents the underlying data and business logic.
View: Handles the presentation layer and user interface.
Controller: Acts as the intermediary between the Model and the View, managing user inputs and actions.
This separation allows for maintainability, scalability, and testability, making it easier to develop and enhance the application over time.


## Layers and MVC Diagrams
The application's flow starts from a landing page offering login, registration, or anonymous access. From there, users are directed to the appropriate form. Once logged in, users, including administrators, have a navigation menu on the left and corresponding content on the right.

Explore individual MVC diagrams for:

-   Landing Page
-   Login Form
-   Change Password Form
-   Register Form
-   Timeline Users
-  Explore
-  Search User
-  Profile


## Database Design
To understand the database implementation, refer to the UML and relational database design provided in the documentation.


## File Structure and Design (CSS)
SLAM features a minimalist and user-friendly interface. The file structure and design utilize JavaServer Pages (JSP) files, structured with a left column for navigation and a right column for content. Customizations were made based on designs from W3Schools, ensuring a clean and enjoyable user experience.

-----------
For further details, explore the source code and documentation. We encourage collaboration and look forward to building a vibrant sports community with SLAM!

*(last version: June 22, 2023)*
