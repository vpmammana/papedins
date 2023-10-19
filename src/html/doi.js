o// Substitua "SEU_DOI_AQUI" pelo DOI que você deseja verificar
const doi = "SEU_DOI_AQUI";

// URL da API da CrossRef
const apiUrl = `https://api.crossref.org/works/${doi}`;

// Faça uma solicitação HTTP GET para a API
fetch(apiUrl)
  .then(response => response.json())
  .then(data => {
    // Verifique a resposta da API e acesse as informações desejadas
    if (data.status === "ok") {
      const work = data.message;
      console.log("Título:", work.title[0]);
      console.log("Autores:", work.author);
      console.log("Data de Publicação:", work.published["date-parts"][0].join("-"));
      // E assim por diante...
    } else {
      console.error("DOI não encontrado ou inválido.");
    }
  })
  .catch(error => {
    console.error("Erro ao consultar a API da CrossRef:", error);
  });

