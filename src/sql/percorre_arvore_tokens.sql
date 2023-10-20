WITH RECURSIVE cte_hierarchy AS (
    -- Base case
    SELECT id_chave_token, id_raiz, nome_token, 
           CAST(nome_token AS CHAR(255)) AS hierarchy
    FROM tokens
    WHERE id_raiz IS NULL
    UNION ALL
    -- Recursive case
    SELECT c.id_chave_token, c.id_raiz, c.nome_token,
           CONCAT(ch.hierarchy, ' -> ', c.nome_token)
    FROM tokens c
    JOIN cte_hierarchy ch ON c.id_raiz = ch.id_chave_token
)
SELECT * FROM cte_hierarchy;

