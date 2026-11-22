# NULL Deneyi

## Deney 1

Sorgu:
```sql
SELECT COUNT(*), COUNT(phone) FROM customer;
```

- **Tahminim:** `COUNT(*)` müşteri tablosundaki tüm satırları sayacağı için 8 sonucunu verecek. `COUNT(phone)` ise yalnızca telefon bilgisi NULL olmayan satırları sayacağı için 5 sonucunu verecek.
- **Sonuç:** `COUNT(*) = 8`, `COUNT(phone) = 5`.
- **Yorum:** Tahminim tuttu. `COUNT(*)` satırların tamamını sayarken `COUNT(phone)` yalnızca phone sütununda NULL olmayan değerleri sayar. Bu nedenle iki sonuç farklıdır.

## Deney 2

Sorgu:
```sql
SELECT AVG(age), SUM(age) / COUNT(*) FROM customer;
```

- **Tahminim:** `AVG(age)` yaş sütunundaki NULL olmayan değerlerin ortalamasını hesaplayacak. `SUM(age) / COUNT(*)` ise yaşların toplamını tüm müşteri satırlarının sayısına bölecek; PostgreSQL'de iki taraf tam sayı türünde olduğundan tam sayı bölmesi gerçekleşecek.
- **Sonuç:** `AVG(age) = 20.8333333333333333`, `SUM(age) / COUNT(*) = 15`.
- **Yorum:** Yaş bilgisi bulunan 6 müşterinin yaşları toplamı 125'tir. AVG NULL değerleri hesaba katmadığı için 125 / 6 sonucunu verir. COUNT(*) ise 8 satırı sayar; 125 / 8 işlemi tam sayı bölmesiyle 15 sonucunu verir. NULL, sıfır olarak değerlendirilmez.
