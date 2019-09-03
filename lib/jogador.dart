import 'dart:io';
import 'package:roguelike/mundo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';

// Classe Jogador é derivada (filha) da classe Personagem
class Jogador extends Personagem {
  // Constantes
  static final String TECLA_CIMA = "W";
  static final String TECLA_BAIXO = "S";
  static final String TECLA_DIREITA = "D";
  static final String TECLA_ESQUERDA = "A";
  static final String SIMBOLO_JOGADOR = "@";
  var entrada;

  int _vidas; // Variável privada (_nomeDaVariavel)
  int passos; // Variável publica
  int _tesouro; // Variável publica

  // Getter para variável vida
  int get vidas => _vidas;

  // Getter para variável vida
  int get tesouro => _tesouro;

  // Construtor padrão + Construtor do pai (super)
  Jogador(Ponto2D posicao, String simbolo, this._vidas)
      : super(posicao, simbolo) {
    this.passos = 0;
    this._tesouro = 0;
  }

  // Método inline verifica se o jogador esta vivo
  bool vivo() => _vidas > 0;

  // Método para dar dano no jogador
  // @dano: valor que será descontado da vida do jogador
  void tomarDano(int dano) {
    this._vidas -= dano;
  }

  void coletarTesouro(int moedinha) {
    this._tesouro += moedinha;
  }

  // Implementação do método abstrato atualizar
  // @mundo: mundo em que o personagem esta no momento
  void atualizar(Mundo mundo) {
    print(
        "Para mover o personagem [W/Cima - S/Baixo - A/Esquerda - D/Direita]: ");

    // Aguarda entrada pelo console e converte para maiusculo
    entrada = stdin.readLineSync().toUpperCase();

    // Verifica se o jogador digitou WASD para move-lo
    if (entrada == TECLA_DIREITA) {
      mover(mundo, 1, 0);
    } else if (entrada == TECLA_ESQUERDA) {
      mover(mundo, -1, 0);
    } else if (entrada == TECLA_CIMA) {
      mover(mundo, 0, -1);
    } else if (entrada == TECLA_BAIXO) mover(mundo, 0, 1);

    // incrementa o número de passos do jogador
    passos++;
  }
}
