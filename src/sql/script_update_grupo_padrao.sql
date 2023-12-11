SELECT "ATRIBUINDO GRUPOS DE TOKENS PARA OS TOKENS";

# está eh uma relacao 1 para N (cada token tem apenas um grupo e cada grupo tem muitos tokens). Foi preciso substituir isso por cada token pode estar em mais de um grupo e cada grupo pode ter mais de um token. O motivo é que aertigo, por exemplo, pode ser do grupo publicacoes_em_periodicos e tambem publicacoes_em_eventos


UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'tweet';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'vídeo';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'podcast';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'live';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'post';

UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'Youtube';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'X';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'Facebook';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'Instagram';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'SouGov';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'TikTok';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'Kawai';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'WhatsApp';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'SMS';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='redes_sociais') WHERE nome_token = 'Telegram';




UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='imprensa') WHERE nome_token = 'reportagem';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='imprensa') WHERE nome_token = 'notícia';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='imprensa') WHERE nome_token = 'coluna';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='imprensa') WHERE nome_token = 'jornal';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='imprensa') WHERE nome_token = 'telejornal';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='imprensa') WHERE nome_token = 'revista de notícias';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='publicacoes_em_periodicos') WHERE nome_token = 'revista científica';


UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='eventos') WHERE nome_token = 'vivência';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='publicacoes_em_eventos') WHERE nome_token = 'resumo';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='publicacoes_em_eventos') WHERE nome_token = 'resumo estendido';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='propriedades_intelectuais') WHERE nome_token = 'INPI';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='propriedades_intelectuais') WHERE nome_token = 'patente';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='propriedades_intelectuais') WHERE nome_token = 'registro de software';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='propriedades_intelectuais') WHERE nome_token = 'modelo de utilidade';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='propriedades_intelectuais') WHERE nome_token = 'licenciamento';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='editoracoes') WHERE nome_token = 'produção editorial';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='editoracoes') WHERE nome_token = 'monografia';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='editoracoes') WHERE nome_token = 'prefácio';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='publicacoes_em_periodicos') WHERE nome_token = 'publicação científica';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='publicacoes_em_periodicos') WHERE nome_token = 'paper';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='publicacoes_em_periodicos') WHERE nome_token = 'artigo';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='eventos') WHERE nome_token = 'reunião';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='servico_publico') WHERE nome_token = 'comitê';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='servico_publico') WHERE nome_token = 'comissão';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='servico_publico') WHERE nome_token = 'conselho';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='editoracoes') WHERE nome_token = 'capítulo';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='editoracoes') WHERE nome_token = 'livro';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='infraestruturas') WHERE nome_token = 'infraestrutura';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='infraestruturas') WHERE nome_token = 'laboratório';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'bibliografia';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'avaliação';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'revisão';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'planejamento';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'projeto';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'plano de trabalho';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'credencial';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'especificação';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'procedimento';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'contrato';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'relato';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'proposição';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'projeção';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'projeto básico';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'análise';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'relatório';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'peça';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'proposta';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'parecer';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'norma';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'diretriz';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'método';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'demanda';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'dado';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='documentos') WHERE nome_token = 'SEI';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='orientacoes') WHERE nome_token = 'supervisão';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='orientacoes') WHERE nome_token = 'bolsista';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='orientacoes') WHERE nome_token = 'iniciação científica';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='material_didatico') WHERE nome_token = 'apostila';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='material_didatico') WHERE nome_token = 'cartilha';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='material_didatico') WHERE nome_token = 'conteúdo';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'correição';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'credenciamento';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'desenvolvimento';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'contratação';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'fomento';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'compra';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'processamento';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'processo';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'pesquisa';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'colaboração';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'organização';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'apostilamento';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'rede';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='processos') WHERE nome_token = 'programa';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='produtos_tecnologicos') WHERE nome_token = 'codificação';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='produtos_tecnologicos') WHERE nome_token = 'código';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='produtos_tecnologicos') WHERE nome_token = 'serviço';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='produtos_tecnologicos') WHERE nome_token = 'equipamento';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='produtos_tecnologicos') WHERE nome_token = 'instrumento';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='produtos_tecnologicos') WHERE nome_token = 'EPI';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='produtos_tecnologicos') WHERE nome_token = 'software';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='produtos_tecnologicos') WHERE nome_token = 'aplicativo';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='formacoes') WHERE nome_token = 'graduação';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='formacoes') WHERE nome_token = 'pós-graduação';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='formacoes') WHERE nome_token = 'curso';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='formacoes') WHERE nome_token = 'disciplina';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='formacoes') WHERE nome_token = 'mestrado';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='formacoes') WHERE nome_token = 'doutorado';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='orientacoes') WHERE nome_token = 'comissão examinadora';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='orientacoes') WHERE nome_token = 'banca';

UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='formacoes') WHERE nome_token = 'universidade';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='formacoes') WHERE nome_token = 'faculdade';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='formacoes') WHERE nome_token = 'escola';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='formacoes') WHERE nome_token = 'EAD';


UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='publicacoes_em_periodicos') WHERE nome_token = 'periódico';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='eventos') WHERE nome_token = 'apresentação';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='eventos') WHERE nome_token = 'debate';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='eventos') WHERE nome_token = 'palestra';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='publicacoes_em_eventos') WHERE nome_token = 'congresso';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='eventos') WHERE nome_token = 'seminário';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='eventos') WHERE nome_token = 'oficina';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='eventos') WHERE nome_token = 'convenção';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='eventos') WHERE nome_token = 'evento';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='eventos') WHERE nome_token = 'extensão';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='publicacoes_em_eventos') WHERE nome_token = 'conferência';
UPDATE tokens SET id_grupo_de_token = (select id_chave_grupo_de_token from grupos_de_tokens where nome_grupo_de_token='eventos') WHERE nome_token = 'fórum';
