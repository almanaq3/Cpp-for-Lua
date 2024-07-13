# C-for-Lua

Este projeto contém uma função Lua que converte código fonte em C++ para Lua. A conversão cobre aspectos básicos de declaração de variáveis, comentários, entrada e saída, operações e retorno da função main.

# Limitações
Cobertura Limitada: O conversor atual cobre apenas elementos básicos como variáveis, comentários, entradas (std::cin) e saídas (std::cout), e retorno de função. Ele não suporta estruturas complexas como classes, templates, ou bibliotecas específicas.

# Conversão Parcial
Funções, laços (for, while), e condições (if, switch) não são tratados, podendo causar erros ou conversões incompletas.

# Manipulação de Strings
O código assume que todas as entradas e saídas são strings. Não há suporte para manipulação complexa de strings ou tipos de dados personalizados.

# Formato Estrito
O código fonte C++ deve seguir um formato específico para ser convertido corretamente. Pequenas variações podem resultar em falhas na conversão.
Comentários: Somente comentários de linha única (//) são convertidos. Comentários de bloco (/* */) não são tratados.
