CREATE TABLE IF NOT EXISTS cscart_department (
    department_id INT(11) unsigned NOT NULL auto_increment,
    status varchar(1) NOT NULL default 'A',
    admin_id INT(11) unsigned NOT NULL default '0',
    user_id varchar(255) NOT NULL default '0',
    KEY(admin_id),
    PRIMARY KEY(department_id)
) ENGINE =InnoDB DEFAULT charset utf8;

CREATE TABLE IF NOT EXISTS cscart_department_descriptions (
    department_id INT(11) unsigned NOT NULL default '0',
    lang_code char(2) NOT NULL default'',
    department_name varchar(255) NOT NULL default '',
    description text NULL ,
    PRIMARY KEY(department_id,lang_code)
) ENGINE =InnoDB DEFAULT charset utf8;

CREATE TABLE IF NOT EXISTS cscart_department_links (
    department_id INT(11) unsigned NOT NULL default '0',
    user_id INT(11) unsigned NOT NULL default '0',
    KEY(department_id),
    KEY(user_id),
    PRIMARY KEY(department_id,user_id)
) ENGINE =InnoDB DEFAULT charset utf8;