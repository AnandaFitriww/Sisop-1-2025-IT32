# Soal 1
membuat file poppo_siroyo.sh

touch poppo_siroyo.sh

Mendownload file reading_data.csv

wget -O reading_data.csv https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download

### a. Menggunakan awk untuk tahu berapa banyak yang dibaca "Chris Hemsworth" dan menghitung buku yang dibacanya/

awk -F, '/Chris Hemsworth/ {count++} END {print "Chris Hemsworth membaca", count, "buku."}' reading_data.csv

- awk -F command yang digunakan untuk memproses teks atau file berbasis baris.
- '/Chris Hemsworth/' awk akan mencari baris dalam reading_data.csv yang mengandung kata "Chris Hemsworth"
- {count++} Menemukan baris yang mengandung "Chris Hemsworth", maka variabel count akan bertambah satu (count++).
- END {print "Chris Hemsworth membaca", count, "buku."} print mencetak hasil akhir dalam format "Chris Hemsworth membaca X buku.", di mana X adalah jumlah baris yang mengandung "Chris Hemsworth"

### b. Menggunakan awk untuk menghitung ra-rata durasi membaca untuk buku-buku yang dibaca menggunakan "Tablet"

awk -F, '$8 == "Tablet" { total += $6; count++ } END { if (count > 0) print "Rata-rata durasi membaca dengan Tablet:", total / count, "menit"; else print "Tidak ada data membaca dengan Tablet." }' reading_data.csv

- $8 == "Tablet" $8 berarti kolom ke-8 dalam file CSV dan Hanya baris yang memiliki "Tablet" di kolom ke-8 yang akan diproses.
- { total += $6; count++ } Jika baris mengandung "Tablet" di kolom ke-8, maka nilai $6 (durasi membaca) ditambahkan ke variabel total dan count++ berarti jumlah baris yang sesuai dengan kondisi juga dihitung.
- END { if (count > 0) print "Rata-rata durasi membaca dengan Tablet:", total / count, "menit" Setelah semua baris diproses bagian END dijalankan dan jika ada setidak nya baris (count > 0), maka rata-rata dihitung: TOtal durasis membaca ; jumlah entri dengan "Tablet"
- else print "Tidak ada data membaca dengan Tablet." } Jika tidak ada baris dengan "Tablet" di kolom 8 (count == 0), maka akan ouput bagian else.

### c. Menggunakan awk untuk mencari siapa yang memeberikan rating tertinggu untuk buku yang dibaca beserta nama dan judul bukunya.

awk -F ',' 'NR > 1 && $7 >= max {if ($7 > max) {max=$7; line=$2" - "$3" - "$7}} END {print "Pembaca dengan rating tertinggi:", line}' reading_data.csv

- NR > 1 NR adalah nomor baris (Number of Record). dan NR > 1 berarti melewati baris pertama, yang biasanya adalah header (judul kolom).
- $7 >= max max adalah variabel yang menyimpan nilai rating tertinggi sejauh ini dan jika $7 lebih besar atau sama dengan max, maka akan diperiksa lebih lanjut.
- iEND {print "Pembaca dengan rating tertinggi:", line} Setelah semua baris diproses, bagian END akan mencetak hasinya.

### d. Menggunakan awk untuk mencari genre yang paling sering dibaca di Asia setelah 31 Desember 2023.

awk -F, 'NR == 1 {next} $9 == "Asia" && $5 > "2023-12-31" {genre_count[$4]++} END {                                                                              
    max_genre = ""; max_count = 0;
    for (genre in genre_count) {
        if (genre_count[genre] > max_count) {
            max_genre = genre;
            max_count = genre_count[genre];
        }
    }
    if (max_genre != "") {
        print "Genre paling populer di Asia setelah 2023 adalah", max_genre, "dengan", max_count, "buku.";
    } else {
        print "Tidak ada data untuk Asia setelah 2023.";
    }
}' reading_data.csv

- max_genre = ""; max_count = 0; Variabel max_genre akan menyimpan genre yang paling populer dan max_count menyimpan jumlah kemunculan tertinggi dari genre tertentu.
- Loop for (genre in genre_count) {} Jika genre_count[genre] lebih besar dari max_count, maka : max_genre diperbarui ke genre sedangkan max_count diperbarui ke jumlah tertinggi 
- max_genre != "" cetak hasil Genre paling populer di Asia setelah 2023 adalah Mystery dengan 14 buku.
dan jika tidak ada data, cetak hasil Tidak ada data untuk Asia setelah 2023.

Setelah semua code dijalnkan kemduain code tersebut dimasukkan ke poppo_siroyo.sh

nano poppo_siroyo.sh
