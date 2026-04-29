ALTER TABLE ost_user_email
ADD UNIQUE (address);

ALTER TABLE ost_user
ADD UNIQUE (default_email_id);

ALTER TABLE `ost_user` ADD UNIQUE( `name`);


ALTER TABLE ost_user_account
ADD UNIQUE (username);

truncate ost_user_email;
truncate ost_user_account;
truncate ost_user;