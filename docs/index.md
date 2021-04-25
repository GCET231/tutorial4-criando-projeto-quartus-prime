# GCET231 Tutorial 4: Criando um Projeto no Quartus Prime

* Autor: João Bittencourt
* Data: 24 de abril de 2021

**Sumário**

* Introdução
* Obtendo os arquivos
* Assistente de Criação de Projetos
* Explorando o projeto recém criado
* Resumo

## Introdução

Nesse tutorial, você irá aprender a criar um projeto no Intel Quartus Prime.  Este tutorial é o primeiro de uma série de guias desenvolvidos como uma introdução ao desenvolvimento de projeto digital utilizando o Quartus Prime.

## Obtendo os arquivos

Antes de começar, certifique-se de obter todos os arquivos deste repositório. Primeiramente, recomendo que você crie um diretório dentro da pasta da disciplina na qual você irá armazenar os arquivos deste e dos próximos tutoriais. 

Primeiramente, você pode ir até o terminal e usar o comando:

`git clone https://github.com/GCET231/tutorial4-criando-projeto-quartus-prime.git`

![Clonando o repositório](https://i.loli.net/2021/04/23/ABKdiQ8GFkjoNCl.gif)

Se preferir, você pode fazer o download dos arquivos clicando em **Code** e em seguida **Download ZIP**. Salve o arquivo em sua estrutura de diretórios e descompacte-os dentro da pasta criada para realização destes tutoriais.

![Baixando o ZIP do repositório](https://i.loli.net/2021/04/24/qaBs7xjXLlVmJUF.gif)

Os procedimentos realizados netre tutorial seguirão a seguinte sistemática:

- Primeiramente veremos como você pode usar o *New Project Wizard* do Quartus Prime para criar um novo projeto.
- Em seguida, veremos quais são os principais elementos de customização do seu projeto.

## Assistente de Criação de Projetos

Abra o Quartus Prime, se já não tiver aberto.

A criação de um projeto é a primeira etapa para iniciar nossos projetos dentro do Quartus Prime, e a ferramenta *"New Project Wizard"* torna esse processo mais fácil pra você. Você pode acessar o *New Project Wizard* a partir da página principal do Quartus Prime, que surge assim que ele é aberto, ou selecionando o menu **File** e então **New Project Wizard**

A primeira página desse assistente descreve as etapas de criação de um projeto. Leia com atenção os itens que estão destacados e clique em **Next**.

![Tela inicial de criacao do projeto](https://i.loli.net/2021/04/25/anp63hbiVyN5Gu8.png)

Agora nós entramos com a informação do diretório onde o projeto será criado. Aqui nós criaremos nosso projeto dentro do diretório **fpga** que se encontra nos arquivos do respositório. Nesse exemplo, chamaremos nosso projeto de `pipemult`, que também será o nome da nossa módulo *top-level* dentro da hierarquia do projeto *(falaremos mais sobre isso depois)*.

Notem que o último campo será preenchido automaticamente para você.

![Diretório, Nome do Projeto e módulo Top-level (Gif)](https://i.loli.net/2021/04/23/OS9QAJget1iM8ln.gif)

Na tela seguinte, você deve escolher se deseja iniciar um projeto vazio, ou a partir de um modelo de projeto, caso você tenha baixado um projeto de exemplo ou estiver trabalhando com uma placa de desenvolvimento.

Nesse último caso, um modelo de projeto pode ajudar uma vez que já traz todas as configurações relacionadas à pinagem de entrada e saída e demais especificações da placa de desenvolvimento. Porém, para o propósito desse tutorial, eu quero criar uma projeto vazio.

![Tipo de Projeto](https://i.loli.net/2021/04/24/GtcNbwWJRM6o4m9.png)

Agora você poderá adiconar arquivos ao seu projeto. 

No diretório `verilog`, dentro deste tutorial vocês vão encontrar os nossos arquivos de exemplo. Para o propósito deste tutorial, adicione apenas o arquivo `ram.sv`.

Para isso, clique nos três pontos para navegar até o diretório onde estão nossos arquivos.

![Adicionar arquivos (Gif)](https://i.loli.net/2021/04/24/LbuoYA4z1ITCB5t.gif)

Na próxima página você deve selecionar o dispositivo FPGA que irá programar. Você pode selecionar a família do dispositivo e sua categoria. Você pode ainda filtrar por tipo de encapsulamento (*Package*), quantidade de pinos (*Pin count*), ou *Core speed grade*.

É possível também buscar por um dispositivo informando o nome do impresso no encapsulamento do dispositivo FPGA. Além disso, você pode escolher o dispositivo FPGA de acordo com uma determinada placa de desenvolvimento, clicando na aba **Board**.

Nesse tutorial, vamos selecionar o *chip* que compõe a plataforma de desenvolvimento [Terasic DE2-115](http://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=139&No=502). Na janela **Family, Device & Board Settings** escolha a família `Cyclone IV E` e o dispositivo `EP4CE115F29C7`, como mostrado a seguir e clique em **Next**.

![Configurações de Família, Dispositivo e Placa (Gif)](https://i.loli.net/2021/04/24/xfmVHFIG9rRckKQ.gif)

Na próxima página você pode escolher as ferramentas e configuração para a simulação, síntese a análise do projeto. Essas ferramentas podem ser adicionadas ou modificadas depois que seu projeto estiver criado.

Por enquanto eu vamos permanecer com as configurações padrão da ferramenta e seguir adiante, clicando em **Next**. 

![Configurações de ferramentas de EDA](https://i.loli.net/2021/04/24/SRnYQsk59W1wTXl.png)

A página final do assistente apresenta um resumo de todas as configurações definidas por você. Clique em **Finish** para criar seu projeto.

## Exporando o Projeto Recém Criado

Como você pode ver, o único arquivo que você pode visualizar em seu projeto é aquele que adicionamos anteriormente (`ram.sv`). Entretanto, o Quartus Prime criou para você, dentro da pasta do projeto um arquivo `.qpf` (ou **Quartus Project File**), usado para abrir o projeto.

![Projeto Criado (Gif)](https://i.loli.net/2021/04/24/Y2AibaCyGEqVvJn.gif)

Além disso, o Quartus Prime cria também um arquivo `.qsf` (ou **Quartus Settings File**), o qual armazena todas as configurações de projeto e atribuições a pinos de entrada e saída. Tire um tempo para analisar esse arquivo com calma. A seguir, apresento um trecho co conteúdo presente no arquivo `pipemult.qsf` criado pelo Quartus Prime:

```tcl
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE115F29C7
set_global_assignment -name TOP_LEVEL_ENTITY pipemult
set_global_assignment -name ORIGINAL_QUARTUS_VERSION 20.1.0
set_global_assignment -name PROJECT_CREATION_TIME_DATE "14:48:46  APRIL 23, 2021"
set_global_assignment -name LAST_QUARTUS_VERSION "20.1.0 Lite Edition"
set_global_assignment -name SYSTEMVERILOG_FILE ../verilog/ram.sv
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
```

Esse arquivo utiliza comandos na linguagem **Tcl** (pronuncia-se *tickle*) para configurar os projetos do Quartus Prime. Nesse arquivo você encontrará todas as configurações implementadas a partir da interface gráfica, em especial, aquelas que relacionam os pinos do FPGA com as portas de entrada e saída do seu circuito. 

> ***Faça você mesmo:*** analise o código acima e tente identificar os elementos de configuração que você definiu usando o Assistente de Criação de Projeto. Observe, com cuidado, cada linha de código para entender a sintaxe Tcl específica do Quartus Prime.

O nome do projeto é exibido na barra de título superior. O módulo *top-level* do projeto aparece na guia **Hierarchy**, da janela **Project Navigator**.

![Aba Project Navigator (Gif)](https://i.loli.net/2021/04/24/8DPETpLHytlIkS7.gif)

Agora você está pronto para criar ou adicionar novos arquivos Verilog para este projeto, o que será abordado no próximo tutorial.

Clique duas vezes no arquivo `ram.sv` para abri-lo no editor de texto do Quartus Prime. O arquivo é então aberto no editor de texto. Por enquanto, você não precisa se preocupar com o funcionamento desse código.

![Abrindo o arquivo ram.sv (Gif)](https://i.loli.net/2021/04/24/j2lrTukVJx7DEeH.gif)

O editor de texto do Quartus Prime é um bom editor para códigos HDL. Ele possui numeração de linha, reconhecimento de sintaxe, além da possibilidade de inserir modelos de função HDL, TCL ou mega-funções nos arquivos através de modelos.

Use o botão **Insert template** para inserir modelos de função nos arquivos de projeto. Explore as opções de modelo pois elas poderão ser úteis no futuro. Alguns exemplos interessantes de serem analisados:

- Verilog HDL `→` Full Designs `→` RAMs and ROMs
- Verilog HDL `→` Full Designs `→` State Machines
- Verilog HDL `→` Constructs `→` Sequential Statements

![Insert template (Gif)](https://i.loli.net/2021/04/24/9Qb6WM8mOKBgrjf.gif)

## Resumo

Nesse tutorial você aprendeu a:

- Com criar um projeto no Quartus Prime;
- Como selecionar um dispositivo de destino para seu projeto;
- Como adicionar arquivos e ao seu projeto.

No próximo tutorial você irá descobrir como completar o desenvolvimento e gerenciar o seu projeto.

---

<a href="#top">Voltar para o início</a> | <a href="">Próximo Tutorial</a> 