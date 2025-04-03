package cursodecola;

import java.util.Scanner;

public class Questao7 {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Recebendo o número decimal
        System.out.print("Digite um numero inteiro para calcular o fatorial: ");
        int numero = entrada.nextInt();

        // Verificando se o número é negativo
        if (numero < 0) {
            System.out.println("Nao e possivel calcular o fatorial de um numero negativo.");
        } else {
            // Calculando o fatorial
            long resultadoFatorial = 1;
            for (int i = 1; i <= numero; i++) {
                resultadoFatorial *= i;
            }

            // Exibindo o resultado
            System.out.println("O fatorial de " + numero + " e: " + resultadoFatorial);
        }

        entrada.close();
    }
}




