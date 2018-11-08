# conference_management

##  Task: 

Conference Management System. There are roles: Administrator, Speaker, Moderator and regular user.
The Administrator can pin, suggest, change the subject of the report after the Speaker, 
as well as regulate time and place of the event. It is necessary to consider the possibility
to view past / future meetings. Every Speaker has rating, depending on the rating is charged 
more bonuses. The Speaker may offer his report. Must be statistics registered people and how
many physically everything came to the Meeting. Implement notifying participants of upcoming events.
 
## Technologies:
    1. Java 8
    2. MySQL 8.0
    3. Liquibase
    4. Lombok
    5. Spring Security

## Initial Setup

To setup this project locally, use the following configuration:

* Project Clone: `Clone project`
* Database
    * Create mysql user `root / 1234`
    * Create schemas `conference_management`, `conference_management_test`
    * Run maven plugin liquidbase update
    * Super admin credential: `super_admin / 123456`

## Testing