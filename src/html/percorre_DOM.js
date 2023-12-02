function enviarDadosParaServidor(dados) {
    console.log(dados);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'debugger_definitivo.php', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify(dados));
}

function coletarDadosDoElemento(elemento) {
    var estilosComputados = window.getComputedStyle(elemento);
    var retangulo = elemento.getBoundingClientRect();
    let elementoParentNodeTag;
    let elementoParentNodeId;	
    let elementoParentNodeClass;
    let elementoParentElementTag;
    let elementoParentElementId;
    let elementoParentElementClass;


    if (elemento.parentNode === null) {
	elementoParentNodeTag = 'ParentNode nulo';
	elementoParentNodeId = 'ParentNode nulo';
	elementoParentNodeClass = 'ParentNode nulo';
    } else {
	elementoParentNodeTag = elemento.parentNode.tagName;
	elementoParentNodeId = elemento.parentNode.id;
	elementoParentNodeClass = elemento.parentNode.className;
    }

    if (elemento.parentElement === null) {
	elementoParentElementTag = 'ParentElement nulo';
	elementoParentElementId = 'ParentElement nulo';
	elementoParentElementClass = 'ParentElement nulo';
    } else {
	elementoParentElementTag = elemento.parentElement.tagName;
	elementoParentElementId = elemento.parentElement.id;
	elementoParentElementClass = elemento.parentElement.className;
    }

	if ( retangulo.top < min_top) {min_top=retangulo.top;}
	if ( retangulo.bottom > max_bottom) {max_bottom=retangulo.bottom;}
	if ( retangulo.left < min_left) {min_left=retangulo.left;}
	if ( retangulo.right > max_right) {max_right=retangulo.right;}

    return {
        tag: elemento.tagName,
        id: elemento.id,
	type: elemento.type,
        class: elemento.className,
	tag_no_pai: elementoParentNodeTag,
	id_no_pai: elementoParentNodeId, 
	class_no_pai: elementoParentNodeClass, 
	tag_elemento_pai: elementoParentElementTag,
	id_elemento_pai: elementoParentElementId, 
	class_elemento_pai: elementoParentElementClass, 
        position: estilosComputados.position,
        display: estilosComputados.display,
        top: retangulo.top,
        left: retangulo.left,
        bottom: retangulo.bottom,
        right: retangulo.right,
        height: retangulo.height,
        width: retangulo.width,
        padding: estilosComputados.padding,
        margin: estilosComputados.margin,
	flex_shrink: estilosComputados.flexShrink,
	max_width: estilosComputados.maxWidth,
	min_width: estilosComputados.minWidth,
	overflow: estilosComputados.overflow
    };
}

function percorrerElementosDoDOM() {
    alert('vai percorrer');
    var todosElementos = document.querySelectorAll('*');
    var dadosElementos = Array.from(todosElementos).map(coletarDadosDoElemento);
    var dados = {
	min_top: min_top,
	max_bottom: max_bottom,
	min_left: min_left,
	max_right: max_right,
    };
    dadosElementos.unshift(dados);
    enviarDadosParaServidor(dadosElementos);
}

