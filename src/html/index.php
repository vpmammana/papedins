<!DOCTYPE html>
<html lang="en" >

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestor de Indicadores</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
</head>


<body class='menu-page' >
    <header>
    <div class="logo-container">
        <img src="logo_fundacentro.jpeg" alt="Logo" id="logo">
    </div>        
    <div class="title-container">
        Sistema de Gestão de Indicadores da pPAPDI
    </div>
	</header>
<div class="menu-container">
<nav>
    <ul>
        <li>
            <a href="https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html_arvore/" target="_blank">
                Formindica
                <span>Formatador de Indicador: <br><br>aqui você formata os autômatas de indicadores, que definem a estrutura sintática do indicador. É preciso privilégios para acessar esse formatador, dado que depois que os indicadores já estão em uso, não é oportuno alterar os autômatas. A alteração dos autômatas depois que os indicadores já estão em uso vai corromper o sistema. Esta opção é para o administrador do sistema. Se você não sabe do que se trata esta opção, não se preocupe com ela.</span>
            </a>
        </li>
        <li>
            <a href="https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/ppapdi.php" target="_blank">
                Gerindica
                <span>Gerador de Indicador: <br><br>aqui você gera os indicadores depois que o autômata de indicador está definido. Não se preocupe com alterar o autômata na opção anterior, porque o administrador já cuidou disso para você. Mas <b>não</b> é oportuno alterar os indicadores nesta opção depois que eles estão em uso. Diferentemente do autômata, alterar o indicador terá como consequência a perda de dados e retrabalho, mas não prejudica o sistema.</span>
            </a>
        </li>
        <li>
            <a href="https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/arvore_de_tokens.php" target="_blank">
                Gervidência
                <span>Gerenciador de Evidências e Veículos: <br><br>aqui você indica quais tokens são característicos de evidências e quais tokens são caracterĩsticos de veículos de divulgação de evidências.</span>
            </a>
        </li>
        <li>
            <a href="https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/mostra_grupos_de_tokens_duplas.php" target="_blank">
                Duplokens
                <span>Aprensentador dos Grupos de tokens por meio de Duplas: <br><br>apresenta todos os grupos de tokens, bem como as evidências e veículos associados. Nesta opção é possível validar uma dupla, que foi originalmente gerada por produto cartesiano.</span>
            </a>
        </li>
        <li>
            <a href="https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/mostra_grupos_de_tokens_duplas_identificadores.php" target="_blank">
                Duplokident
                <span>Aprensentador dos Grupos, Duplas e identificadores<br><br>apresenta todos os grupos de tokens, bem como as evidências e veículos associados, vinculando aos indentificadores. Nesta opção é possível validar uma dupla, que foi originalmente gerada por produto cartesiano.</span>
            </a>
        </li>
        <li>
            <a href="https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/mostra_grupos_de_tokens_div_n_to_n.php" target="_blank">
                Grupokens
                <span>Aprensentador dos Grupos de tokens: <br><br>apresenta todos os grupos de tokens, bem como seus integrantes..</span>
            </a>
        </li>
        <li>
            <a href="https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/inseridencia.php" target="_blank">
                Inseridência
                <span>Inserção de Evidências: <br><br>aqui você insere as evidências e respectivos veículos de divulgação. Os indicadores serão sugeridos automaticamente para cada nova inserção..</span>
            </a>
        </li>
        <li>
            <a href="https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/tabela_evidencias.php" target="_blank">
                Tabelidência
                <span>Tabela de Evidências: <br><br>aqui você visualiza  as evidências.</span>
            </a>
        </li>
    </ul>
</nav>
</div>
</body>

</html>

