
package cursodecola;

import java.util.Scanner;

public class Questao2 {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int[] listaNumeros = new int[5];

        for (int indice = 0; indice < 5; indice++) {
            System.out.print("Digite o numero " + (indice + 1) + ": ");
            listaNumeros[indice] = entrada.nextInt();
        }

        System.out.println("Numeros impares recebidos:");
        for (int numero : listaNumeros) {
            if (numero % 2 != 0) {
                System.out.println(numero);
            }
        }

        entrada.close();
    }
}


