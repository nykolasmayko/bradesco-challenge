# bradesco-challenge
Desafio do Bradesco


## Estrutura e Descrição do Projeto
1. Models
   1. Library.swift: Modelo abstrato de dados referente às tecnologias que serão seriliazadas a partir do JSON enviado pela API;
   1. Owner.swift: Modelo abstrato de dados referente ao dono da tecnologia serializada;
   1. GitWrapper.swift: Modelo abstrato referente ao objeto JSON enviado pela API do Git, onde serializa-se apenas os dados contidos na chave *items*.

1. Controlers
   1. Serializarion.swift: Protocolo responsável por realizar a serialização dos dados do JSOn de maneira mais legível e fácil no fluxo dos dados;
   1. LibraryTableViewCell.swift: Classe que controla a célula da *tableView* contida na controller.
   
1. Storyboards

1. Helpers
   1. Extensions.swift: Extensões dos tipos de dados (Bool, String, Int, Dictionary, Array) para serem convertidos ao acessar as chaves do JSON via o protocolo Serialization;
   1. ApiResource.swift: Protocolo genérico que encapsula as informações básicas da API (URL Base, Método, Modelo, Linguagem e Sorting), além de implementar a função *makeModel* que irá transformar o dado em algum dos modelos abstratos de dados (Library, Owner...);
   1. NetworkRequest.swift: Protocolo genérico responsável por realizar a requisição à apartir de uma ApiResource, via a classe genérica *APiRequest*, que irá realizar a chamada para a URL conforme implementação do protocolo ApiResource.
   
   
