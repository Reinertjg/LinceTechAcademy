package cursodecola;

import java.util.Scanner;

public class Questao6 {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Recebendo as medidas dos catetos
        System.out.print("Digite o valor do primeiro cateto: ");
        double cateto1 = entrada.nextDouble();

        System.out.print("Digite o valor do segundo cateto: ");
        double cateto2 = entrada.nextDouble();

        // Calculando o quadrado dos catetos sem usar Math.pow()
        double quadradoCateto1 = cateto1 * cateto1;
        double quadradoCateto2 = cateto2 * cateto2;

        // Calculando a soma dos quadrados
        double somaQuadrados = quadradoCateto1 + quadradoCateto2;

        // Calculando a raiz quadrada manualmente
        double hipotenusa = raizQuadrada(somaQuadrados);

        // Exibindo o resultado
        System.out.println("O valor da hipotenusa e: " + hipotenusa);

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
