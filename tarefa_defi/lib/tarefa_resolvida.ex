defmodule TarefaExp do
  
    #Função para calcular a soma 
    def calculo_soma(x, erro) do
      soma = Decimal.new(1) #iniciando varável soma e termo 
      termo = Decimal.new(1)
      i = 1 #iniciando meu iterador

      iterate(termo, soma, i, x, erro) #chamando a função auxiliar para a iteração 
    end
  

      '''
      Função iterate, essa função iterate vai ser uma função auxiliar que vai ajudar para calcular o termo, soma e verificação.
      Essa verificação é feita a partir do da comparação do termo atual com o erro, caso seja menor ou igual pare o algoritmo
      Caso não seja menor ou igual ao erro, o else vai chamar a função recursiva com os termos atualizados, sendo a assinatura:
      iterate(termo_atual,soma_atual,i+1,x,erro).




      Como que foi feito o cálculo? o termo atual foi calculado através da da multiplicação do termo atual pela divisão de x/i 
      A multiplicação se da para calcular o fatorial e a exponencial sendo a parte de cima x * x * x e o de baixo i * i+1 * i+2 ... até o fim do loop  

      A soma_atual é a soma do termo_atual com a soma 

      Comparações: eu faço uma comparação do tipo erro >= termo_atual, caso dê true retorna a soma_atual para ser printada na tela  
      Comparações: Logo em seguida tem o else que chama a função recursivamente atualizando os parâmetros da função 
      '''

  
   defp iterate(termo, soma, i, x, erro) do 
    termo_atual = Decimal.mult(termo, Decimal.div(x, i)) 

    soma_atual = Decimal.add(soma, termo_atual)

    IO.puts("Iteração #{i} com o ERRO #{Decimal.to_string(erro)} A SOMA FICA #{Decimal.to_string(soma)}")
    if Decimal.abs(Decimal.sub(soma_atual, soma)) <= erro do  
      soma_atual

    else
      iterate(termo_atual,soma_atual,i+1,x,erro)
    end
  end
end

'''
Aqui no módulo Main é basicamente uma função que lida com o recebimento e a inicialização das varáveis que serão postas no código
Para conseguir rodar esse código precisa colocar no ambiente dentro do iex = Main.rodando()
Logo em seguida será requisitado para o cliente os dígitos expressivos da mantissa e o expoente do número, considerando que todos os números serão de base 10
Novamente é pedido o erro aos modos do X sendo a mantissa e logo em seguida o expoente, em ambos os casos se espera um número negativo no expoente.
'''

defmodule Main do
    def rodando do
   IO.puts("Digite o valor da mantissa do X: ")
   x_input = IO.gets("")
   |> String.trim()
   |> String.to_integer()

   IO.puts("Digite o valor do expoente do valor X:  ")
   x_exp = IO.gets("")
   |> String.trim()
   |> String.to_integer()

   IO.puts("Digite a mantissa do erro  ")
   erro_input = IO.gets("")
   |> String.trim()
   |> String.to_integer()

   IO.puts("Digite o expoente do erro  ")
   erro_exp = IO.gets("")
   |> String.trim()
   |> String.to_integer()


   x = Decimal.new(1, x_input, x_exp) 
   erro = Decimal.new(1, erro_input, erro_exp) 

   res = TarefaExp.calculo_soma(x, erro)

    IO.puts("e^x #{Decimal.to_string(x)} = #{Decimal.to_string(res)}")
  end
end

Main.rodando()
