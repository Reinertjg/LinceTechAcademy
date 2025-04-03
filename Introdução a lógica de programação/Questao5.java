package cursodecola;

import java.util.Scanner;

public class Questao5 {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        System.out.print("Digite o coeficiente A: ");
        double coeficienteA = entrada.nextDouble();

        System.out.print("Digite o coeficiente B: ");
        double coeficienteB = entrada.nextDouble();

        System.out.print("Digite o coeficiente C: ");
        double coeficienteC = entrada.nextDouble();

        // Calculando o delta sem usar Math.pow()
        double delta = (coeficienteB * coeficienteB) - (4 * coeficienteA * coeficienteC);

        if (delta < 0) {
            System.out.println("Nao existem raizes reais para esta equacao.");
        } else {
            // Calculando a raiz de delta sem usar Math.sqrt()
            double raizDelta = raizQuadrada(delta);

            // Calculando as raizes da equacao de Bhaskara
            double raiz1 = (-coeficienteB + raizDelta) / (2 * coeficienteA);
            double raiz2 = (-coeficienteB - raizDelta) / (2 * coeficienteA);

            System.out.println("As raizes da equacao sao:");
            System.out.println("X1 = " + raiz1);
            System.out.println("X2 = " + raiz2);
        }

        entrada.close();
    }

    // Metodo para calcular raiz quadrada manualmente usando o metodo de Newton
    public static double raizQuadrada(double numero) {
        double estimativa = numero / 2;
        double precisao = 0.00001;

        while ((estimativa * estimativa - numero) > precisao || (numero - estimativa * estimativa) > precisao) {
            estimativa = (estimativa + numero / estimativa) / 2;
        }

        return estimativa;
    }
}
