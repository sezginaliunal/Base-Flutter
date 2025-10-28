String formatCurrency(String currency) {
  switch (currency) {
    case 'TL':
      return '₺'; // Türk Lirası
    case 'EUR':
      return '€'; // Euro
    case 'USD':
      return r'$'; // ABD Doları
    case 'GBP':
      return '£'; // İngiliz Sterlini
    case 'JPY':
      return '¥'; // Japon Yeni
    case 'AUD':
      return r'A$'; // Avustralya Doları
    case 'CAD':
      return r'C$'; // Kanada Doları
    case 'CHF':
      return 'CHF'; // İsviçre Frangı
    case 'CNY':
      return '¥'; // Çin Yuanı
    case 'SEK':
      return 'kr'; // İsveç Kronu
    case 'NZD':
      return r'NZ$'; // Yeni Zelanda Doları
    case 'RUB':
      return '₽'; // Rus Rublesi
    case 'INR':
      return '₹'; // Hindistan Rupisi
    case 'ZAR':
      return 'R'; // Güney Afrika Randı
    default:
      return ''; // Tanımsız para birimi
  }
}
