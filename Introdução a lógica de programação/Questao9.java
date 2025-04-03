package cursodecola;

import java.util.Scanner;

public class Questao9 {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Recebendo o texto
        System.out.print("Digite um texto: ");
        String texto = entrada.nextLine();

        // Inicializando variaveis para contagem
        int quantidadeVogais = 0;
        int quantidadeConsoantes = 0;
        int quantidadeLetras = 0;
        int quantidadePalavras = 0;
        boolean dentroDePalavra = false;

        // Percorrendo o texto caractere por caractere
        for (int i = 0; i < texto.length(); i++) {
            char caractere = texto.charAt(i);

            // Verificando se é uma letra
            if ((caractere >= 'a' && caractere <= 'z') || (caractere >= 'A' && caractere <= 'Z')) {
                quantidadeLetras++;

                // Verificando se é uma vogal
                if (caractere == 'a' || caractere == 'e' || caractere == 'i' || caractere == 'o' || caractere == 'u' ||
                    caractere == 'A' || caractere == 'E' || caractere == 'I' || caractere == 'O' || caractere == 'U') {
                    quantidadeVogais++;
                } else {
                    quantidadeConsoantes++;
                }

                // Controlando a contagem de palavras
                if (!dentroDePalavra) {
                    quantidadePalavras++;
                    dentroDePalavra = true;
                }
            } else {
                // Se encontrar um caractere que não seja letra, encerra a palavra atual
                dentroDePalavra = false;
            }
        }

        // Exibindo os resultados
        System.out.println("Quantidade de vogais: " + quantidadeVogais);
        System.out.println("Quantidade de consoantes: " + quantidadeConsoantes);
        System.out.println("Quantidade total de letras: " + quantidadeLetras);
        System.out.println("Quantidade de palavras: " + quantidadePalavras);

        entrada.close();
    }
}
