# script que preenche as tabelas tipos_de_evidencias e tipos_de_veiculos. Esse script é gerado a cada acesso à página arvore_de_tokens.php

start transaction;

delete from tipos_de_evidencias;

delete from tipos_de_veiculos;


commit;