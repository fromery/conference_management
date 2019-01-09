# conference_management - pet project

##  Project Description: 

Conference Management System. There are roles: Administrator, Speaker, Moderator and regular user.
The Administrator can pin, suggest, change the subject of the report after the Speaker, 
as well as regulate time and place of the event. It is necessary to consider the possibility
to view past / future reports. Every Speaker has rating, depending on the rating is charged 
more bonuses. The Speaker may offer his report. Must be statistics registered people and how
many physically everything came to the Meeting. Implement notifying participants of upcoming events.
 
## Role permissions
 
 ![role permission imige](/src/main/webapp/resources/info/readmeRolePermissions.png)
 
## Database design

![database imige](/src/main/webapp/resources/info/readme_database.png)
 
## Back-end Technologies:
    1. Java 8
    2. MySQL 8
    3. Liquibase
    4. Lombok
    5. Spring Security (xml configuration)
    6. Spring MVC (xml configuration)
    7. Spring Data (xml configuration)
    8. Hibernate

## Front-end Technologies:
    1. JSP
    2. HTML
    3. CSS
    4. Javascript
    5. jQuery

## Initial Setup

To setup this project locally, use the following configuration:

* Project Clone: `Clone project`
* Database
    * Change password for mysql user `root / 1234` - run `ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';`
    * Create schemas `conference_management`, `conference_management_test`     
```
        drop schema conference_management;
        create schema conference_management;
        drop schema conference_management_test;
        create schema conference_management_test;
```
* Run maven plugin `liquidbase:update`
* Credentials: 
    - `admin / 123456`
    - `moderator / 123456`
    - `user / 123456`
    
