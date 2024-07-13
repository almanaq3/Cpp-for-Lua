--> Função que converte um código em C++ para Lua
function converterParaLua(codigoCpp)
    local codigoLua = ""

    --> Conversão de variáveis e comentários
    codigoLua = codigoCpp:gsub("#include <iostream>", "")
    codigoLua = codigoLua:gsub("int main%(%) {%s*", "")
    codigoLua = codigoLua:gsub("// (.-)\n", "-- %1\n")
    codigoLua = codigoLua:gsub("int (.-);", "local %1")
    
    --> Conversão de entradas e saídas
    codigoLua = codigoLua:gsub('std::cout << "(.-)"%s*;', 'print("%1")')
    codigoLua = codigoLua:gsub('std::cout << "(.-)" << (.-) << std::endl;', 'print("%1" .. %2)')
    codigoLua = codigoLua:gsub('std::cin >> (.-);', '%1 = io.read("*n")')
    
    --> Conversão de operações e retorno
    codigoLua = codigoLua:gsub("(.-) = (.-);", "%1 = %2")
    codigoLua = codigoLua:gsub("return 0;", "")

    --> Fechamento da função main
    codigoLua = codigoLua:gsub("}", "")

    return codigoLua
end

--> Coloque o código C++ aqui dentro de [[ ]], exemplo:
local codigoCpp = [[
#include <iostream>

int main() {
    // Declaração das variáveis
    int num1, num2, soma;

    // Solicita ao usuário para inserir os dois números
    std::cout << "Digite o primeiro número: ";
    std::cin >> num1;

    std::cout << "Digite o segundo número: ";
    std::cin >> num2;

    // Calcula a soma dos dois números
    soma = num1 + num2;

    // Exibe o resultado da soma
    std::cout << "A soma dos dois números é: " << soma << std::endl;

    return 0;
}
]]

local codigoLua = converterParaLua(codigoCpp)
print(codigoLua)