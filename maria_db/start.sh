#!/bin/bash

if [ ! -d /var/lib/mysql/mysql ]; then
	# Виставляємо коректні права доступу
	chown mysql:mysql /var/lib/mysql

	# Ініціалізуємо системні таблиці
	mysql_install_db
fi
# Вішаємо зупинку MySQL(MariaDB) на сигнал TERM
trap "mysqladmin shutdown" TERM

# Запускаємо MySQL(MariaDB) в фон
mysqld_safe --bind-address=0.0.0.0 &

# Очікуємо завершення всіх народжених процесів
wait
