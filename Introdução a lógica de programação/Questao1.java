package cursodecola;

import java.util.Scanner;

public class Questao1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite o primeiro numero: ");
        double numero1 = scanner.nextDouble();

        System.out.print("Digite o segundo numero: ");
        double numero2 = scanner.nextDouble();

        if (numero1 == 0 || numero2 == 0) {
            System.out.println("Erro: nao e possivel dividir por zero.");
        } else {
            // Determinar manualmente o maior e o menor numero
            double maior, menor;

            if (numero1 > numero2) {
                maior = numero1;
                menor = numero2;
            } else {
                maior = numero2;
                menor = numero1;
            }

            double resultado = maior / menor;
            System.out.printf("O resultado da divisao de %.2f por %.2f e %.2f\n", maior, menor, resultado);
        }

        scanner.close();
    }
}
