enum CampoEditadoMoeda { origem, destino }

final Map<String, Map<String, double>> taxas = {
  'BRL': {
    'USD': 0.1761,
    'EUR': 0.1558,
    'JPY': 25.4987,
    'GBP': 0.1310,
  },
  'USD': {
    'BRL': 5.6393,
    'EUR': 0.8783,
    'JPY': 143.84,
    'GBP': 0.7388,
  },
  'EUR': {
    'BRL': 6.4185,
    'USD': 1.1385,
    'JPY': 163.72,
    'GBP': 0.8412,
  },
  'JPY': {
    'BRL': 0.0392,
    'USD': 0.0070,
    'EUR': 0.0061,
    'GBP': 0.0051,
  },
  'GBP': {
    'BRL': 7.6325,
    'USD': 1.3534,
    'EUR': 1.1888,
    'JPY': 194.64,
  }
};
