-- Dump inicial da etapa 4.
-- Execute este arquivo no banco etapa_4_app depois de criá-lo no RDS.

BEGIN;

CREATE TABLE IF NOT EXISTS public.app_messages (
    id BIGSERIAL PRIMARY KEY,
    slug VARCHAR(80) NOT NULL UNIQUE,
    title VARCHAR(120) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO public.app_messages (slug, title, content)
VALUES (
    'mensagem-principal',
    'Mensagem inicial',
    'Backend conectado ao PostgreSQL no Amazon RDS.'
)
ON CONFLICT (slug) DO UPDATE
SET
    title = EXCLUDED.title,
    content = EXCLUDED.content,
    updated_at = NOW();

COMMIT;
