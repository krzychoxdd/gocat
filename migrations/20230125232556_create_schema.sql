-- +goose Up
-- +goose StatementBegin

CREATE TABLE IF NOT EXISTS public.users
(
    id uuid PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    password VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS public.projects
(
    id uuid PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    password VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS public.project_files
(
    id uuid PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    password VARCHAR(255)
);

-- +goose StatementEnd
