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
                <span>Formatador de Indicador: <br><br>aqui você formata os autômatas de indicadores, que definem a estrutura sintática do indicador. É preciso privilégios para acessar esse formatador, dado que depois que os indicadores já estão em uso, não é oportuno alterar os autômatas. A alteração dos autômatas depois que os indicadores já estão em uso vai corromper os dados.</span>
            </a>
        </li>
        <li>
            <a href="https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/ppapdi.php" target="_blank">
                Gerindica
                <span>Gerador de Indicador: <br><br>aqui você gera o indicador depois que o autômata de indicador está definido. Também não é oportuno <b>não</b> alterar os indicadores depois que eles estão em uso mas, diferentemente dos autômata, alterar o indicador terá como consequência a perda de dados, mas não prejudica o sistema.</span>
            </a>
        </li>
        <li>
            <a href="https://hpo3yjcd.specchio.info/dev_vitor/papedins/src/html/arvore_de_tokens.php" target="_blank">
                Gerenveidência
                <span>Gerenciador de Evidências e Veículos: <br><br>aqui você indica quais tokens são característicos de evidências e quais tokens são caracterĩsticos de veículos de divulgação de evidências.</span>
            </a>
        </li>
        <li>
            <a href="https://www.example.com/inseridencia" target="_blank">
                Inseridência
                <span>Inserção de Evidências: <br><br>aqui você insere as evidências e respectivos veículos de divulgação. Os indicadores serão sugeridos automaticamente para cada nova inserção..</span>
            </a>
        </li>
    </ul>
</nav>
</div>
</body>

</html>
