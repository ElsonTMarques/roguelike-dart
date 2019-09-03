import 'dart:math';
import 'package:roguelike/mundo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';

// Classe Criatura é derivada (filha) da classe Personagem
class Carneiro extends Personagem {
  // Constantes
  static final String FICAR_PARADO = '';
  static final String TECLA_CIMA = "W";
  static final String TECLA_BAIXO = "S";
  static final String TECLA_DIREITA = "D";
  static final String TECLA_ESQUERDA = "A";
  static final String SIMBOLO_CRIATURA = "C";

  // Variável privada para criar números aleatório
  Random _aleatorio;

  // Construtor padrão + Construtor do pai (super)
  Carneiro(Ponto2D posicao, String simbolo) : super(posicao, simbolo) {
    // Random(SEED)
    // SEED = NULL indica que vai pegar o tempo atual
    _aleatorio = Random(null);
  }

  // Implementação do método abstrato atualizar
  // @mundo: mundo em que o personagem esta no momento
  void atualizar(Mundo mundo) {
    // criar um número aleatório entre 0 e 100,
    // logo em seguida, calcula o resto da divisão por 5,
    // ou seja, só podemos ter os seguintes valores: 0, 1, 2, 3 e 4
    //var direcao = _aleatorio.nextInt(1000) % QUANTIDADE_MOVIMENTOS;
    var direcaoX = mundo.jogador.posicao.x;
    var direcaoY = mundo.jogador.posicao.y;

    // desloca a bodinho conforme o valor aleatório gerado
    if (direcaoX == posicao.x-1 && direcaoY == posicao.y) {
      mover(mundo, 1, 0);
    } else if (direcaoX == posicao.x+1 && direcaoY == posicao.y) {
      mover(mundo, -1, 0);
    } else if (direcaoY == posicao.y+1 && direcaoX == posicao.x) {
      mover(mundo, 0, -1);
    } else if (direcaoY == posicao.y-1 && direcaoX == posicao.x) mover(mundo, 0, 1);
  
  }
}