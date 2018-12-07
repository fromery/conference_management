    drop table user if exists;

    create table user (
        id bigint generated by default as identity,
        email varchar(255),
        firstName varchar(255),
        lastName varchar(255),
        username varchar(255),
        password varchar(255),
        role varchar(255),
        primary key (id)
    );

insert into user (id, email, firstName, lastName, username, password, role) values (null, 'admin@gmail.com', 'AdminFN', 'AdminLN', 'admin', '123456', 'ROLE_USER');
