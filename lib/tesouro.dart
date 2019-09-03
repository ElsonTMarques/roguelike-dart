import 'dart:math';

import 'package:roguelike/mundo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';

// Classe abstrata que representa qualquer tipo de personagem (NPC ou Controlável)
class Tesouro extends Personagem {
// Constantes
  static final String SIMBOLO_CRIATURA = "G";
  var entrada;

  // Variável privada para criar números aleatório
  Random _aleatorio;

  // Construtor padrão + Construtor do pai (super)
  Tesouro(Ponto2D posicao, String simbolo)
    : super(posicao, simbolo) {
    _aleatorio = Random(null);
  }


  // Implementação do método abstrato atualizar
  // @mundo: mundo em que o personagem esta no momento
  void atualizar(Mundo mundo) {
  }
}
