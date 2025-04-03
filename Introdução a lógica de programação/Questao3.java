package cursodecola;

import java.util.Scanner;

public class Questao3 {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        System.out.print("Digite o primeiro numero: ");
        int numero1 = entrada.nextInt();

        System.out.print("Digite o segundo numero: ");
        int numero2 = entrada.nextInt();

        int resultadoAbsoluto = Math.abs(numero1 - numero2);

        System.out.println("O valor absoluto da subtracao e: " + resultadoAbsoluto);

        entrada.close();
    }
}

