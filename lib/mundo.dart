import 'dart:math';

import 'package:roguelike/carneiro.dart';
import 'package:roguelike/celula.dart';
import 'package:roguelike/criatura.dart';
import 'package:roguelike/jogador.dart';
import 'package:roguelike/lobo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';
import 'package:roguelike/tesouro.dart';

// Classe que representa o mundo do jogo
class Mundo {
  // Variável privada que guarda a largura e altura do mundo
  int _largura, _altura;
  // Matriz de células (grade) que define o mapa
  List<List<Celula>> mapa;
  // Lista de criaturas (NPCs)
  List<Criatura> criaturas;
   // Lista de carneiros (NPCs)
  List<Carneiro> carneiros;
  // Lista de lobo (NPCs)
  List<Lobo> lobos;
  // Lista de lobo (NPCs)
  List<Tesouro> tesouros;
  // Jogador controlado
  Jogador jogador;

  // Construtor padrão do mundo
  // @mapa: mapa criado de qualquer forma
  // @crituras: lista de criaturas posicionadas
  Mundo(this.mapa, this.criaturas, this.carneiros, this.lobos, this.tesouros) {
    _largura = mapa.length;
    _altura = mapa[0].length;
  }
  
  // Método que verifica se uma posição X,Y do mapa esta bloqueada ou não
  bool bloqueado(int x, int y) {
    return mapa[x][y].bloqueado;
  }

  // Método que atualiza todas as criaturas do mundo
  void atualizar() {
    // Atualiza a posição do jogador
    jogador.atualizar(this);

    // FOREACH: atualiza a posição de todas as criaturas
    for (Criatura criatura in criaturas) {
      // Atualiza a posição de uma criatura
      criatura.atualizar(this);

      // Se a posição de uma criatura for igual a posição do jogador
      if (criatura.posicao.toString() == jogador.posicao.toString()) {
        // jogador toma 1 de dano (perde uma vida)
        jogador.tomarDano(1);
      }
    }

        // FOREACH: atualiza a posição de todas as criaturas
    for (Carneiro carneiro in carneiros) {
      // Atualiza a posição de uma criatura
      carneiro.atualizar(this);

      // Se a posição de uma criatura for igual a posição do jogador
      // if (criatura.posicao.toString() == jogador.posicao.toString()) {
      //   // jogador toma 1 de dano (perde uma vida)
      //   jogador.tomarDano(1);
      // }
    }

            // FOREACH: atualiza a posição de todas as criaturas
    for (Lobo lobo in lobos) {
      // Atualiza a posição de uma criatura
      lobo.atualizar(this);

      // Se a posição de uma criatura for igual a posição do jogador
      if (lobo.posicao.toString() == jogador.posicao.toString()) {
        // jogador toma 1 de dano (perde uma vida)
        jogador.tomarDano(1);
      }
    }

    for (Tesouro tesouro in tesouros) {
      // Atualiza a posição de uma criatura
      tesouro.atualizar(this);

      Random aleatorio = Random();

      // Se a posição de uma criatura for igual a posição do jogador
      if (tesouro.posicao.toString() == jogador.posicao.toString()) {
        // jogador toma 1 de dano (perde uma vida)
        jogador.coletarTesouro(50 + (aleatorio.nextInt(100 - 50)));
        tesouro.posicao = null;
      }
    }
  }

  // Método para desenhar o mundo no console
  void desenhar() {

    // Criar um mapa de criaturas baseado em suas posições
    Map<String, Personagem> map = Map();
    for (Criatura creature in criaturas) {
      map[creature.posicao.toString()] = creature;
    }

    for (Carneiro goat in carneiros) {
      map[goat.posicao.toString()] = goat;
    }

    for (Lobo wolf in lobos) {
      map[wolf.posicao.toString()] = wolf;
    }

    for (Tesouro treasure in tesouros) {
      map[treasure.posicao.toString()] = treasure;
    }


    // Adicionamos também o jogador no mapa
    map[jogador.posicao.toString()] = jogador;

    // Exibe informações do jogador
    print("Jogador está em [${jogador.posicao}]");
    print("Vidas: ${jogador.vidas}");
    print("Passos: ${jogador.passos}");
    print("Tesouros: ${jogador.tesouro}");

    // Desenhar o mapa (percorre todas as linhas)
    for (int y = 0; y < _altura; y++) {
      var line = "";
      // Percorre todas as colunas
      for (int x = 0; x < _largura; x++) {

        // SE na posição X, Y existe algo além do chão, então
        if (map[Ponto2D(x, y).toString()] != null) {
          // SE a posição tem um jogador, desenha o jogador, caso contrário desenha a criatura
          if (map[Ponto2D(x, y).toString()].simbolo == Jogador.SIMBOLO_JOGADOR) {
            line += '\u001b[34;1m' + map[Ponto2D(x, y).toString()].toString();
          } else {
            line += '\u001b[31;1m' + map[Ponto2D(x, y).toString()].toString();
          }
        } else { // Desenha o mapa
          line += '\u001b[0m' + mapa[x][y].toString();
        }
      }
      print(line);
    }
  }
}