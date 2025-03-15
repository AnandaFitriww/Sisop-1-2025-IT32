# Sisop-1-2025-IT32
- Alif Bima Permadani (5027241020)
- Ananda Fitri Wibowo (5027241057)
- Raihan Fahri Ghazali (5027241061)

# Soal 1
Solved by. 061_Raihan Fahri Ghazali
membuat file poppo_siroyo.sh
```
touch poppo_siroyo.sh
```
Mendownload file reading_data.csv

wget -O reading_data.csv https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download

### a. Menggunakan awk untuk tahu berapa banyak yang dibaca "Chris Hemsworth" dan menghitung buku yang dibacanya/
```
awk -F, '/Chris Hemsworth/ {count++} END {print "Chris Hemsworth membaca", count, "buku."}' reading_data.csv
```
- awk -F command yang digunakan untuk memproses teks atau file berbasis baris.
- '/Chris Hemsworth/' awk akan mencari baris dalam reading_data.csv yang mengandung kata "Chris Hemsworth"
- {count++} Menemukan baris yang mengandung "Chris Hemsworth", maka variabel count akan bertambah satu (count++).
- END {print "Chris Hemsworth membaca", count, "buku."} print mencetak hasil akhir dalam format "Chris Hemsworth membaca X buku.", di mana X adalah jumlah baris yang mengandung "Chris Hemsworth"

### b. Menggunakan awk untuk menghitung ra-rata durasi membaca untuk buku-buku yang dibaca menggunakan "Tablet"
```
awk -F, '$8 == "Tablet" { total += $6; count++ } END { if (count > 0) print "Rata-rata durasi membaca dengan Tablet:", total / count, "menit"; else print "Tidak ada data membaca dengan Tablet." }' reading_data.csv
```
- $8 == "Tablet" $8 berarti kolom ke-8 dalam file CSV dan Hanya baris yang memiliki "Tablet" di kolom ke-8 yang akan diproses.
- { total += $6; count++ } Jika baris mengandung "Tablet" di kolom ke-8, maka nilai $6 (durasi membaca) ditambahkan ke variabel total dan count++ berarti jumlah baris yang sesuai dengan kondisi juga dihitung.
- END { if (count > 0) print "Rata-rata durasi membaca dengan Tablet:", total / count, "menit" Setelah semua baris diproses bagian END dijalankan dan jika ada setidak nya baris (count > 0), maka rata-rata dihitung: TOtal durasis membaca ; jumlah entri dengan "Tablet"
- else print "Tidak ada data membaca dengan Tablet." } Jika tidak ada baris dengan "Tablet" di kolom 8 (count == 0), maka akan ouput bagian else.

### c. Menggunakan awk untuk mencari siapa yang memeberikan rating tertinggu untuk buku yang dibaca beserta nama dan judul bukunya.
```
awk -F ',' 'NR > 1 && $7 >= max {if ($7 > max) {max=$7; line=$2" - "$3" - "$7}} END {print "Pembaca dengan rating tertinggi:", line}' reading_data.csv
```
- NR > 1 NR adalah nomor baris (Number of Record). dan NR > 1 berarti melewati baris pertama, yang biasanya adalah header (judul kolom).
- $7 >= max max adalah variabel yang menyimpan nilai rating tertinggi sejauh ini dan jika $7 lebih besar atau sama dengan max, maka akan diperiksa lebih lanjut.
- iEND {print "Pembaca dengan rating tertinggi:", line} Setelah semua baris diproses, bagian END akan mencetak hasinya.

### d. Menggunakan awk untuk mencari genre yang paling sering dibaca di Asia setelah 31 Desember 2023.
```
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
```
- max_genre = ""; max_count = 0; Variabel max_genre akan menyimpan genre yang paling populer dan max_count menyimpan jumlah kemunculan tertinggi dari genre tertentu.
- Loop for (genre in genre_count) {} Jika genre_count[genre] lebih besar dari max_count, maka : max_genre diperbarui ke genre sedangkan max_count diperbarui ke jumlah tertinggi 
- max_genre != "" cetak hasil Genre paling populer di Asia setelah 2023 adalah Mystery dengan 14 buku.
dan jika tidak ada data, cetak hasil Tidak ada data untuk Asia setelah 2023.

Setelah semua code dijalnkan kemduain code tersebut dimasukkan ke poppo_siroyo.sh
```
nano poppo_siroyo.sh
```



# Soal 3
3. Solved by. 057_Ananda Fitri Wibowo
Untuk merayakan ulang tahun ke 52 album The Dark Side of the Moon, tim PR Pink Floyd mengadakan sebuah lomba dimana peserta diminta untuk membuat sebuah script bertemakan setidaknya 5 dari 10 lagu dalam album tersebut. Sebagai salah satu peserta, kamu memutuskan untuk memilih Speak to Me, On the Run, Time, Money, dan Brain Damage. Saat program ini dijalankan, terminal harus dibersihkan terlebih dahulu agar tidak mengganggu tampilan dari fungsi fungsi yang kamu buat. Program ini dijalankan dengan cara ./dsotm.sh --play=”<Track>” dengan Track sebagai nama nama lagu yang kamu pilih. [Author: Afnaan / honque]

#Tampilan awal dulu hehe + penggunaan if untuk case input trek yang berbeda-beda
![Screenshot 2025-03-15 214133](https://github.com/user-attachments/assets/f537f888-6498-489c-91da-af5e295b14de)
Script di atas saya buat hanya sekedar untuk mendramatisir(?) agar seolah-olah ada proses yang harus dilakukan sebelum input trek dieksekusi. Sleep membuat proses eksekusi dipause selama sekian detik. Clear akan menghapus semua output sebelumnya dari terminal.

![Screenshot 2025-03-15 214222](https://github.com/user-attachments/assets/2e5aebfc-7c29-4aba-882c-34fb1c7a2136)
Script di atas merupakan batasan/syarat untuk melakukan suatu keputusan berdasarkan kondisi yang ditentukan.
“ -–play=* “ merepresentasikan base argumen, yang kemudian dapat dilanjutkan dengan judul trek agar program yang diinginkan dapat berjalan, “ * ” menandakan input setelah –-play= dapat berupa kata/trek apapun dan akan menjadi argumen 1 (melanjutkan “ --play= “).

### a. Speak to Me
Untuk lagu ini, kamu memutuskan untuk membuat sebuah fitur yang memanggil API yang baru saja kamu temukan kemarin, https://github.com/annthurium/affirmations untuk menampilkan word of affirmation setiap detik.
Speak to Me.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, word of affirmation baru harus ditampilkan tiap detik.

![Screenshot 2025-03-15 214243](https://github.com/user-attachments/assets/51ec90ee-61d3-4dfe-bfab-d51d3bc4c357)
#case “$trek” in digunakan untuk membuat trek-trek yang bisa dijadikan sebagai argumen 1
#”Speak to Me” adalah trek pertama
#Dari blok hijau sampai hijau hanyalah pemanis juga, seperti script dramatisasi di awal tadi, agar ada tampilan semacam loading sebelum program dieksekusi.

while true adalah menginisiasi loopnya, agar program dijalankan terus menerus, do — done adalah batasan command yang harus dilakukan dalam loop

curl -s “https…….” akan memanggil API dari link yang tertera (curl nya), -s membuat proses dilakukan secara silent atau menghilangkan informasi dari progres curl
“ | “ merupakan pipe, mengambil output curl sebagai input selanjutnya
jq -r ‘.affirmation’ untuk mencetak file JSON secara gundul (tanpa tanda-tanda petik/quote)
sleep 1 mempause terminal selama 1 detik
;; digunakan untuk membedakan case ini dengan case selanjutnya

### b. On the Run
Selanjutnya, kamu memutuskan untuk membuat sebuah progress bar yang berjalan dengan interval random (setiap progress bertambah dalam interval waktu yang random dengan range 0.1 detik sampai 1 detik).
On the Run.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, progress bar harus memiliki perhitungan persentase, dan panjang dari progress bar tidak berubah ubah (selalu dari ujung kiri terminal ke ujung kanan terminal seperti pada gif)

![Screenshot 2025-03-15 214257](https://github.com/user-attachments/assets/33f41b05-3c65-41f5-911c-7cb7a944e7be)
#”On the Run” adalah trek kedua
#Dilanjut dengan tampilan progres secara manual tadi

pnj = 50 merupakan panjang dari progres bar yang akan ditampilkan (sepanjang 50 karakter)
for ((i=1; i<=pnj; i++)); do merupakan iterasi untuk loopnya, yakni sebanyak pnj (50)
printf “\r……. / pnj)) mencetak progres bar, mengisinya dengan karakter “ / ”, dan menampilkan persentase progresnya juga
sleep $(......* 0.9’) menunda progres bar agar prosesnya berjalan secara berkala dengan jeda secara random
echo “Done” sebagai pemanis untuk mencetak Done
;; merupakan pemisah case ini dengan case lain

### c. Time
Singkat saja, untuk time, kamu memutuskan untuk membuat live clock yang menunjukkan tanggal, jam, menit dan detik.
Time.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, jam harus setidaknya menunjukkan tahun, bulan, tanggal, jam, menit, dan detik yang diperbaharui setiap detik.


![Screenshot 2025-03-15 224715](https://github.com/user-attachments/assets/599859ec-cd60-4f66-bf2a-56f0029667e1)
#”Time” adalah trek ketiga
#dilanjut tampilan progres seperti sebelum-sebelumnya
while true adalah menginisiasi loopnya, agar program dijalankan terus menerus, do — done adalah batasan command yang harus dilakukan dalam loop

echo “=====” hanya sebagai tampilan tambahan biar tampilan waktu lebih terlihat bagus
date +’ %a %b %e %Y%n %H:%M:%S’ digunakan untuk menampilkan data waktu
%a: hari (disingkat), %: bulan (disingkat), %e: tanggal, %Y: tahun, %n: enter, %H: jam dalam format 24 jam, %M: menit, %S: detik
sleep 1 mempause terminal selama 1 detik
tput cuu 4 untuk menggeser output terminal sebanyak 4 baris ke atas, agar jam terlihat kena refresh tiap detiknya
;; merupakan pemisah satu case dengan case lain

### d. Money
Kamu teringat dengan program yang sangat disukai oleh teman mu yang bernama cmatrix. Kamu pun memutuskan untuk membuat program yang mirip, tetapi mengganti isinya dengan simbol mata uang seperti $ € £ ¥ ¢ ₹ ₩ ₿ ₣ dan lain lainnya.
Money.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, matrix tersusun oleh simbol mata uang minimal 5 simbol yang berbeda.


![Screenshot 2025-03-15 214358](https://github.com/user-attachments/assets/cdb8d354-cc19-41fb-b82b-56dab045b90b)
#”Money” merupakan trek keempat
#dilanjut tampilan progres seperti sebelumnya

![Screenshot 2025-03-15 214422](https://github.com/user-attachments/assets/2859d78d-bdc5-4bb1-8cd7-f1a25939fb6a)
echo -e "\033[2J\033[?25l" untuk clear terminal dan menyembunyikan kursor dari terminal
R dan C adalah command untuk mengambil baris dan kolom secara random
SYMBOLS adalah simbol sesuai ketentuan yang akan ditampilkan
p dan l untuk menentukan panjang dan letak baris matrix secara random yang akan ditampilkan
for(.......) adalah iterasi dari baris ke sekian (lihat menggunakan R)
c=${.....} digunakan untuk mengambil simbol secara random untuk ditampilkan
echo -e yang atas mencetak simbol dalam warna hijau, yang bawah mencetaknya dalam warna putih
sleep mempause tampilan sebesar 0.05 detik, menentukan seberapa lama simbol(matrix) akan dicetak
if [....], then — fi akan menghapus simbol-simbol setelah dicetak, untuk memberi kesan pudar
for (.....); do — done akan menghapus sisa-sisa jejak simbol sebelumnya setelah simbol dicetak sampai ujung
& akan membuat semua proses dari dijalankan di background, agar beberapa baris simbol dapat dicetak pada waktu yang sama
sleep 0.05 memberikan waktu sekian detik untuk baris simbol selanjutnya dapat dicetak

![Screenshot 2025-03-15 234222](https://github.com/user-attachments/assets/9ac64665-1f9a-4753-b2e6-eb208972dcff)
script tersebut merupakan referensi saya dalam membuat efek matrix ini. sc: BruXy: Matrix effect in BASH


### d. Brain Damage
Untuk lagu Brain Damage, kamu mendapatkan ide untuk menampilkan proses yang sedang berjalan, seperti task manager tetapi menampilkannya di dalam terminal dan membuat agar task manager tersebut menampilkan data baru setiap detiknya.
Brain Damage.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, data harus sesuai dengan ps/top dan sejenisnya.

![Screenshot 2025-03-15 214445](https://github.com/user-attachments/assets/04b78b4c-88f2-481a-af3d-3a6418fa7c33)
#”Playing” merupakan trek terakhir/kelima
#dilanjut dengan progres seperti sebelum-sebelumnya
while true membuat commandnya me-looping
do – done merupakan batas command apa yang harus dilakukan
echo “====” merupakan pemanis biar tampilan task manager kw lebih bagus
echo “USER…… COMMAND” adalah nama pada tabel (sortir proses)
ps -eo akan menampilkan proses yang sedang dijalankan, kemudian disortir melalui -o menjadi hanya menampilkan user, pid, cpu, mem, stime, command
“ | “ merupakan pipe untuk mengambil output sebelumnya menjadi input ke awk nya
awk ‘NR<==13’ membuat proses yang ditampilkan hanyalah 13 baris teratas


![Screenshot 2025-03-15 214515](https://github.com/user-attachments/assets/c856cb52-e8fe-48fb-826d-1c9ffb8866f6)
#” * “ merupakan semua trek selain 5 trek di atas (yang tidak ada di input). Misal kalau ngasih input “ ./dsotm --play=”Cinta Satu Malam” “, karena “Cinta Satu Malam” bukan trek yang ada di database, maka akan mencetak “maaf abangku,...... lain yah”


;; merupakan pemisah satu case dengan case lain
esac merupakan akhir dari case, untuk mengakhiri case
else adalah jika input yang diberi tidak sesuai kondisi-kondisi yang sudah ditentukan. Misal kita masukin “ ./dsotm play lagu dong “, maka akan muncul info “banh… format inputnya loh salah:( “
fi ada penanda akhir dari if

### Di sini juga bisa dicek:)
https://docs.google.com/document/d/1Zu8GYXqj5HwukhYgjAWSPCiNbVtTwV30KleZEwF1S6E/edit?tab=t.0
