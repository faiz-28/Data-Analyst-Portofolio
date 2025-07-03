# Analisis Data Wholesale Customers

Proyek ini merupakan eksplorasi data pelanggan grosir (Wholesale Customers) menggunakan Python. Analisis difokuskan pada pemahaman pola pembelian pelanggan berdasarkan beberapa variabel seperti Fresh, Milk, Grocery, Frozen, Detergents_Paper, dan Delicatessen. Proyek ini juga mengintegrasikan pendekatan statistik dan visualisasi untuk membantu memahami karakteristik klaster pelanggan.

## 🔍 Tujuan Proyek

- Melakukan eksplorasi data pelanggan grosir.
- Mengidentifikasi pola pembelian melalui analisis deskriptif dan visualisasi.
- Mengelompokkan pelanggan berdasarkan kemiripan perilaku pembelian.
- Memberikan wawasan yang dapat digunakan untuk segmentasi pasar atau strategi pemasaran.

## 📊 Dataset

Dataset yang digunakan merupakan data pelanggan grosir yang tersedia secara publik. Dataset ini memuat informasi tahunan dari 440 pelanggan yang berasal dari dua wilayah berbeda: Horeca (Hotel/Restaurant/Café) dan Retail.

Fitur utama:
- `Fresh`
- `Milk`
- `Grocery`
- `Frozen`
- `Detergents_Paper`
- `Delicatessen`
- `Channel` dan `Region` sebagai label kategorikal

  > **Wholesale Customer Dataset**
  > 

## 🛠️ Tools & Library

Proyek ini menggunakan bahasa pemrograman Python dengan pustaka berikut:
- Pandas
- NumPy
- Matplotlib & Seaborn
- Scikit-learn

## 📌Tahapan Analisis

Beberapa langkah analisis yang dilakukan dalam notebook:
1. **Eksplorasi awal data**: melihat distribusi data dan nilai-nilai ekstrem.
2. **Visualisasi distribusi**: boxplot dan histogram untuk masing-masing fitur.
3. **Skalasi data**: normalisasi menggunakan StandardScaler untuk mendukung analisis klaster.
4. **Analisis Klaster**: menggunakan K-Means dan evaluasi menggunakan metode Elbow dan Silhouette Score.
5. **Interpretasi hasil**: menyajikan visualisasi klaster dan wawasan dari masing-masing segmen pelanggan.

## 📎 Hasil dan Insight

- Pelanggan dapat dikelompokkan ke dalam beberapa segmen berdasarkan preferensi produk.
- Fitur seperti `Detergents_Paper` dan `Grocery` sangat mempengaruhi pembentukan klaster.
- Visualisasi PCA membantu merepresentasikan klaster dalam dimensi dua secara intuitif.

