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

 
>📎 [Link Dataset (UCI Machine Learning)](https://archive.ics.uci.edu/dataset/292/wholesale+customers)

---

## 📌Tahapan Analisis

Berikut adalah tahapan yang dilakukan dalam proyek segmentasi pelanggan menggunakan metode K-Means Clustering:

### 1. 📌 Pemahaman Data  
Langkah pertama dilakukan dengan memuat dataset dan meninjau struktur data secara umum, termasuk tipe variabel dan distribusi awal fitur. Fokus utama diberikan pada enam fitur numerik  yang mewakili besarnya pembelian pelanggan.

### 2. 🧹 Prapemrosesan Data  
Dataset kemudian diproses dengan melakukan pengecekan terhadap missing values serta penyesuaian skala variabel numerik menggunakan **StandardScaler** agar setiap fitur memiliki kontribusi yang setara dalam perhitungan jarak antar data. Kolom `Region` dan `Channel` dipisahkan dari data numerik agar tidak memengaruhi proses klasterisasi.

### 3. 📊 Reduksi Dimensi  
Untuk keperluan visualisasi, dilakukan reduksi dimensi menggunakan **Principal Component Analysis (PCA)** ke dalam dua komponen utama. Hal ini bertujuan untuk menggambarkan penyebaran cluster dalam ruang dua dimensi secara lebih intuitif, tanpa mengorbankan banyak informasi penting.

### 4. 🔍 Menentukan Jumlah Cluster Optimal  
Pemilihan jumlah cluster optimal dilakukan melalui dua pendekatan: **Elbow Method** dan **Silhouette Score**. Visualisasi nilai inertia terhadap jumlah cluster digunakan untuk mengidentifikasi titik optimal (_elbow point_) sebagai dasar pemilihan jumlah cluster yang paling representatif.

### 5. 📦 K-Means Clustering  
Setelah jumlah cluster ditentukan, model **K-Means** diterapkan untuk melakukan segmentasi pelanggan. Label hasil klasterisasi kemudian ditambahkan ke dataset awal untuk dianalisis lebih lanjut.

### 6. 🧠 Analisis Karakteristik Tiap Cluster  
Rata-rata pembelian pada tiap fitur dihitung untuk setiap cluster guna memahami profil konsumsinya. Perbedaan karakteristik antar cluster divisualisasikan dalam bentuk **Radar Chart**, yang memberikan gambaran menyeluruh mengenai preferensi produk di tiap segmen pelanggan.

### 7. 📉 Distribusi Cluster terhadap Channel  
Distribusi pelanggan dari tiap cluster ditinjau berdasarkan channel (Horeca vs Retail). Hasil analisis divisualisasikan melalui **Heatmap** dan dihitung dalam bentuk persentase untuk menampilkan proporsi relatif antar segmen terhadap saluran distribusinya.

---

## 🛠️ Tools & Teknologi
- **Python** (Pandas, NumPy, Scikit-learn, Seaborn, Matplotlib)
- **Jupyter Notebook** untuk eksplorasi dan dokumentasi interaktif
- **Clustering**: K-Means, PCA
- **Visualisasi**: Heatmap, Radar Chart, Elbow Curve

---

## ❓ Pertanyaan Bisnis yang Dapat Dijawab

1. **Bagaimana pelanggan wholesale dapat dikelompokkan berdasarkan pola pembelian produk mereka?**  

2. **Apa saja karakteristik unik dari setiap segmen pelanggan yang terbentuk?**  

3. **Segmen pelanggan mana yang paling banyak berasal dari saluran Horeca dan mana dari Retail?**  

4. **Produk apa yang paling diminati oleh pelanggan di masing-masing cluster?**  

5. **Apakah pelanggan dari channel tertentu (Retail atau Horeca) menunjukkan pola pembelian tertentu?**  

6. **Bagaimana strategi pemasaran dapat disesuaikan untuk tiap segmen pelanggan?**  

7. **Apakah terdapat peluang untuk meningkatkan loyalitas pelanggan dari segmen tertentu?**  

8. **Segmen pelanggan mana yang potensial untuk ditargetkan sebagai pelanggan besar (B2B)?**  

9. **Apa rekomendasi bisnis berbasis data untuk meningkatkan efektivitas penjualan dan distribusi?**  

---

### 🔎 Insight Utama

#### 1. Segmentasi Berdasarkan Pola Pembelian Produk (Radar Chart)

- **Cluster 1** menunjukkan konsumsi yang sangat tinggi pada produk `Fresh`, yang mengindikasikan bahwa pelanggan dalam kelompok ini kemungkinan berasal dari sektor hotel, restoran, atau katering (Horeca).
- **Cluster 2** memiliki dominasi konsumsi pada produk `Milk`, `Grocery`, dan `Detergents_Paper` yang mengindikasikan perilaku belanja ritel rumah tangga atau toko kecil.
- **Cluster 4** memperlihatkan konsumsi tinggi secara merata pada hampir semua kategori produk, sehingga dapat diasumsikan sebagai kelompok pelanggan besar (bulk buyers), seperti instansi atau perusahaan yang melakukan pembelian dalam jumlah besar dan beragam.
- **Cluster 0 dan Cluster 3** memiliki tingkat konsumsi yang relatif rendah dan menyebar di seluruh produk, hal ini menunjukkan karakteristik pelanggan dengan volume belanja kecil atau tidak spesifik pada kategori tertentu.

#### 2. Distribusi Pelanggan Berdasarkan Channel (Heatmap)

- Pelanggan pada **Cluster 1, 3, dan 4** didominasi oleh channel **Horeca**, hal tersebut selaras dengan preferensi mereka terhadap produk seperti `Fresh`, `Frozen`, dan `Delicatessen`.
- Sebaliknya, **Cluster 2 dan 0** lebih banyak berasal dari channel **Retail**, hal ini sesuai dengan kecenderungan konsumsi produk kebutuhan rumah tangga dan volume pembelian yang lebih kecil.

Temuan ini memperkuat hasil radar chart dan menunjukkan bahwa segmentasi berbasis pola konsumsi juga sejalan dengan kanal distribusi pelanggan. Hal ini memberikan dasar yang kuat untuk menyusun strategi pemasaran dan distribusi yang lebih terarah, sesuai dengan karakteristik masing-masing segmen.

---

### 💡 Rekomendasi Strategis untuk Implementasi Bisnis

| Cluster | Karakteristik Produk Dominan             | Channel Dominan | Rekomendasi Implementasi                                                                 |
|---------|-------------------------------------------|------------------|------------------------------------------------------------------------------------------|
| **Cluster 0** | Konsumsi rendah di semua kategori       | Retail           | Strategi yang dapat diterapkan adalah edukasi produk, pemberian promo pembelian awal, serta bundling paket kecil untuk mendorong volume transaksi.       |
| **Cluster 1** | Sangat tinggi pada `Fresh`             | Horeca           | Pendekatan terbaik adalah menyediakan paket produk segar dengan sistem langganan, serta menjalin kerja sama langsung dengan pelaku industri Horeca untuk distribusi berkala.    |
| **Cluster 2** | Dominan di `Grocery`, `Milk`, `Detergents_Paper` | Retail |strategi yang tepat adalah menyediakan paket kebutuhan rumah tangga, sistem isi ulang berkala, dan program loyalti untuk mendorong pembelian berulang.         |
| **Cluster 3** | Konsumsi rendah/moderat, fokus Frozen | Horeca           | Strategi yang dapat dilakukan adalah dengan membuat bundling produk beku dan lebih ditargetkan pada restoran skala menengah atau katering kecil       |
| **Cluster 4** | Tinggi di semua fitur (multikategori)  | Horeca           | Pendekatan jangka panjang seperti kontrak pasokan reguler dan sistem distribusi terjadwal akan lebih efektif dalam menjaga loyalitas serta memastikan kestabilan permintaan.

---
### 📊 Visualisasi
<div align="center">
  <img src="Visualisasi/Heatmap Distribusi Pelanggan per Cluster Terhadap Channel.png" alt="Dashboard Preview" width="700"/>
</div>
<div align="center">
  <img src="Visualisasi/Radar Chart Karakteristik Produk Tiap Cluster.png" alt="Dashboard Preview" width="700"/>
</div>

---


