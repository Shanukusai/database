/* Задача 2
Написать скрипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы
(с перечнем полей, указанием индексов и внешних ключей)
*/

DROP TABLE IF EXISTS post;
CREATE TABLE post (
	id SERIAL PRIMARY KEY,
	author_user_id BIGINT UNSIGNED NOT NULL,
    owner_to_user_id BIGINT UNSIGNED NOT NULL,
    subjects_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id),
    FOREIGN KEY (subjects_id) REFERENCES subjects(id),
    FOREIGN KEY (media_id) REFERENCES media(id),
);

DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects(
	id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS comment;
CREATE TABLE comment (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
    post_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), -- можно будет даже не упоминать это поле при вставке

    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);