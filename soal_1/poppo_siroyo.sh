wget -O reading_data.csv https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download

awk -F, '/Chris Hemsworth/ {count++} END {print "Chris Hemsworth membaca", count, "buku."}' reading_data.csv

awk -F, '$8 == "Tablet" { total += $6; count++ } END { if (count > 0) print "Rata-rata durasi membaca dengan Tablet:", total / count, "menit"; else print "Tidak ada data membaca dengan Tablet." }' reading_data.csv

awk -F ',' 'NR > 1 && $7 >= max {if ($7 > max) {max=$7; line=$2" - "$3" - "$7}} END {print "Pembaca dengan rating tertinggi:", line}' reading_data.csv

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