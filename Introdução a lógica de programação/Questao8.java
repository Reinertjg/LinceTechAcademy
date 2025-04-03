package cursodecola;

import java.util.Scanner;

public class Questao8 {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Recebendo o numero
        System.out.print("Digite um numero para calcular sua tabuada: ");
        int numero = entrada.nextInt();

        // Calculando e imprimindo a tabuada manualmente
        for (int i = 1; i <= 9; i++) {
            int resultado = 0;
            
            // Realizando a multiplicacao manualmente (soma repetida)
            for (int j = 0; j < i; j++) {
                resultado += numero;
            }

            // Exibindo o resultado
            System.out.println(numero + " x " + i + " = " + resultado);
        }

        entrada.close();
    }
}

