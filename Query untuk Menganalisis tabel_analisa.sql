--Perbandingan Pendapatan Kimia Farma dari Tahun ke Tahun
SELECT
  EXTRACT(YEAR FROM date) AS tahun,
  SUM(nett_sales) AS total_pendapatan
FROM rakamin-kf-analytics-479407.kimia_farma.tabel_analisa
GROUP BY tahun
ORDER BY tahun 


--Indonesia's Geo Map Untuk Total Profit Masing-masing Provinsi
SELECT 
  provinsi,
  SUM(nett_profit) AS total_profit
FROM rakamin-kf-analytics-479407.kimia_farma.tabel_analisa
GROUP BY provinsi
ORDER BY total_profit DESC

--Top 10 Total transaksi cabang provinsi
SELECT 
  provinsi,
  COUNT(transaction_id) AS total_transaksi
FROM rakamin-kf-analytics-479407.kimia_farma.tabel_analisa
GROUP BY provinsi
ORDER BY total_transaksi DESC
LIMIT 10

--Top 10 Nett sales cabang provinsi
SELECT 
  provinsi,
  SUM(nett_sales) AS total_nett_sales
FROM rakamin-kf-analytics-479407.kimia_farma.tabel_analisa
GROUP BY provinsi
ORDER BY total_nett_sales DESC
LIMIT 10

--Top 5 Cabang Dengan Rating Tertinggi, namun Rating Transaksi Terendah
SELECT 
  branch_name,
  provinsi,
  ROUND(AVG(rating_cabang),2) AS rerata_rating_cabang,
  ROUND(AVG(rating_transaksi),2) AS rerata_rating_transaksi
FROM rakamin-kf-analytics-479407.kimia_farma.tabel_analisa
GROUP BY branch_name, provinsi
ORDER BY rerata_rating_cabang DESC, rerata_rating_transaksi ASC
LIMIT 5




