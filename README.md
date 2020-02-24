# system_programming

Вариант 25
Скрипт настройки пользователей для администратора:
•	проверяет, запущен ли скрипт от пользователя root, если не от root – выдавать ошибку
•	запрашивает имя пользователя, если такого пользователя нет в системе – выдаёт ошибку
•	запрашивает одно из действий: установить дату истечения срока действия пароля, изменить командную оболочку пользователя, изменить домашнюю директорию пользователя
•	запрашивает параметры в зависимости от типа действия:
o	для срока действия пароля – дату, после которой пароль нужно будет поменять
o	для командной оболочки – предложить на выбор из списка (/bin/sh, /bin/bash, /sbin/nologin) /sbin/nologin используется для того, чтобы пользователь не мог пойти в систему, но присутствовал в /etc/passwd
o	для домашней директории – путь до директории. Если директории, которую указал администратор не существует, создать новую.
