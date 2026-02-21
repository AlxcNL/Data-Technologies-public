# MySQL

## Installation

```bash
sudo apt update && sudo apt install mysql-server
sudo systemctl start mysql.service
```

## Start and stop
```bash
sudo service mysql start
sudo service mysql stop
```

## Login
```bash
sudo mysql -u root -p
```

## Navigate
```sql
show databases;
use sakila;
show tables;
SELECT now();
```

## Execute script
```sql
source script.sql;
```
