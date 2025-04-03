package cursodecola;

import java.util.Scanner;

public class Questao4 {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        System.out.print("Digite o primeiro numero: ");
        double numero1 = entrada.nextDouble();

        System.out.print("Digite o segundo numero: ");
        double numero2 = entrada.nextDouble();

        double menorMultiploComum = calcularMenorMultiploComum(numero1, numero2);

        System.out.println("O menor multiplo comum e: " + menorMultiploComum);

        entrada.close();
    }

    public static double calcularMenorMultiploComum(double numero1, double numero2) {
        double maiorNumero = Math.max(numero1, numero2);
        double menorNumero = Math.min(numero1, numero2);

        double multiplo = maiorNumero;
        while (multiplo % menorNumero != 0) {
            multiplo += maiorNumero;
        }

        return multiplo;
    }
}


