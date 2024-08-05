# Input e Output em Bend

## Introdução

As operações de Input e Output (I/O) são fundamentais em qualquer linguagem de programação. Em Bend, essas operações são tratadas de forma segura e controlada, seguindo o paradigma de programação funcional.

## Conceitos Fundamentais

### Efeitos Colaterais e Pureza

Em programação funcional, as funções puras são aquelas que sempre produzem o mesmo resultado para os mesmos argumentos, sem efeitos colaterais. No entanto, operações de I/O são inerentemente impuras, pois interagem com o mundo externo.

Bend resolve este paradoxo encapsulando operações de I/O em um tipo especial `IO`, que representa computações que podem ter efeitos colaterais.

### O Tipo `IO`

O tipo `IO` em Bend é uma mônada que encapsula operações impuras. Isso permite que o sistema de tipos diferencie entre computações puras e impuras, mantendo a integridade do programa.

## Operações Básicas de I/O

### Impressão (`IO/print`)

A função `IO/print` é usada para exibir texto na saída padrão.

```bend
def IO/print(text):
  # Implementação interna
```

Esta função converte a string de entrada em bytes UTF-8 e os escreve no descritor de arquivo padrão de saída.

### Entrada (`IO/input`)

A função `IO/input` lê uma linha de texto da entrada padrão.

```bend
def IO/input():
  # Implementação interna
```

Esta implementação lê bytes um por um até encontrar um caractere de nova linha, acumulando-os e depois decodificando-os como UTF-8.

## Operações de Arquivo

Bend fornece um conjunto de funções para manipulação de arquivos, incluindo:

- `IO/FS/open`: Abre um arquivo
- `IO/FS/close`: Fecha um arquivo
- `IO/FS/read`: Lê bytes de um arquivo
- `IO/FS/write`: Escreve bytes em um arquivo
- `IO/FS/seek`: Move o ponteiro de leitura/escrita em um arquivo

### Exemplo: Escrita em Arquivo

```bend
def write_to_file():
  with IO:
    fp <- IO/FS/open("testing.txt", "w")
    input <- read_input()
    * <- IO/FS/write(fp, String/encode_utf8(input))
    * <- IO/FS/write(fp, String/encode_utf8("\n"))
    return IO/FS/close(fp)
```

Este exemplo demonstra como abrir um arquivo, escrever dados nele e fechá-lo corretamente.

## Gerenciamento de Recursos

Em Bend, é importante gerenciar recursos como descritores de arquivo corretamente. O uso do padrão `with IO:` ajuda a garantir que as operações de I/O sejam realizadas de forma segura e que os recursos sejam liberados adequadamente.

## Tratamento de Erros

Operações de I/O são propensas a erros (por exemplo, arquivo não encontrado, permissões insuficientes). Em Bend, esses erros são tipicamente representados usando tipos de resultado, permitindo um tratamento de erros robusto e explícito.

## Considerações de Desempenho

Ao trabalhar com I/O, especialmente com arquivos grandes, é importante considerar o desempenho. Operações de leitura e escrita em blocos maiores geralmente são mais eficientes do que operações byte a byte.

## Conclusão

As operações de I/O em Bend são projetadas para serem seguras, expressivas e alinhadas com os princípios da programação funcional. Ao encapsular efeitos colaterais no tipo `IO`, Bend permite que os programadores escrevam código que interage com o mundo externo de maneira controlada e previsível.
