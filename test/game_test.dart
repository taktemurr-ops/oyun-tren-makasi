import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_tren_makasi/oyun_tren_makasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(trenMakasiConfig.title.length, 33);
    expect(trenMakasiConfig.tagline.length, 33);
    for (final s in trenMakasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(trenMakasiConfig.gameId, trenMakasiId);
    expect(trenMakasiRules.gameId, trenMakasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(trenMakasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: trenMakasiId, optionalMechanics: trenMakasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(trenMakasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
