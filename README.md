# Sisop-1-2025-IT32
- Alif Bima Permadani (5027241020)
- Ananda Fitri Wibowo (5027241057)
- Raihan Fahri Ghazali (5027241061)




3. Solved by. 057_Ananda Fitri Wibowo 
Untuk merayakan ulang tahun ke 52 album The Dark Side of the Moon, tim PR Pink Floyd mengadakan sebuah lomba dimana peserta diminta untuk membuat sebuah script bertemakan setidaknya 5 dari 10 lagu dalam album tersebut. Sebagai salah satu peserta, kamu memutuskan untuk memilih Speak to Me, On the Run, Time, Money, dan Brain Damage. Saat program ini dijalankan, terminal harus dibersihkan terlebih dahulu agar tidak mengganggu tampilan dari fungsi fungsi yang kamu buat. Program ini dijalankan dengan cara ./dsotm.sh --play=”<Track>” dengan Track sebagai nama nama lagu yang kamu pilih. [Author: Afnaan / honque]

#Tampilan awal dulu hehe + penggunaan if untuk case input trek yang berbeda-beda
![Screenshot 2025-03-15 214133](https://github.com/user-attachments/assets/f537f888-6498-489c-91da-af5e295b14de)
Script di atas saya buat hanya sekedar untuk mendramatisir(?) agar seolah-olah ada proses yang harus dilakukan sebelum input trek dieksekusi. Sleep membuat proses eksekusi dipause selama sekian detik. Clear akan menghapus semua output sebelumnya dari terminal.

![Screenshot 2025-03-15 214222](https://github.com/user-attachments/assets/2e5aebfc-7c29-4aba-882c-34fb1c7a2136)
Script di atas merupakan batasan/syarat untuk melakukan suatu keputusan berdasarkan kondisi yang ditentukan.
“ -–play=* “ merepresentasikan base argumen, yang kemudian dapat dilanjutkan dengan judul trek agar program yang diinginkan dapat berjalan, “ * ” menandakan input setelah –-play= dapat berupa kata/trek apapun dan akan menjadi argumen 1 (melanjutkan “ --play= “).

Speak to Me
Untuk lagu ini, kamu memutuskan untuk membuat sebuah fitur yang memanggil API yang baru saja kamu temukan kemarin, https://github.com/annthurium/affirmations untuk menampilkan word of affirmation setiap detik.
Speak to Me.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, word of affirmation baru harus ditampilkan tiap detik.


#case “$trek” in digunakan untuk membuat trek-trek yang bisa dijadikan sebagai argumen 1
#”Speak to Me” adalah trek pertama
#Dari blok hijau sampai hijau hanyalah pemanis juga, seperti script dramatisasi di awal tadi, agar ada tampilan semacam loading sebelum program dieksekusi.

while true adalah menginisiasi loopnya, agar program dijalankan terus menerus, do — done adalah batasan command yang harus dilakukan dalam loop

curl -s “https…….” akan memanggil API dari link yang tertera (curl nya), -s membuat proses dilakukan secara silent atau menghilangkan informasi dari progres curl
“ | “ merupakan pipe, mengambil output curl sebagai input selanjutnya
jq -r ‘.affirmation’ untuk mencetak file JSON secara gundul (tanpa tanda-tanda petik/quote)
sleep 1 mempause terminal selama 1 detik
;; digunakan untuk membedakan case ini dengan case selanjutnya

On the Run
Selanjutnya, kamu memutuskan untuk membuat sebuah progress bar yang berjalan dengan interval random (setiap progress bertambah dalam interval waktu yang random dengan range 0.1 detik sampai 1 detik).
On the Run.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, progress bar harus memiliki perhitungan persentase, dan panjang dari progress bar tidak berubah ubah (selalu dari ujung kiri terminal ke ujung kanan terminal seperti pada gif)


#”On the Run” adalah trek kedua
#Dilanjut dengan tampilan progres secara manual tadi

pnj = 50 merupakan panjang dari progres bar yang akan ditampilkan (sepanjang 50 karakter)
for ((i=1; i<=pnj; i++)); do merupakan iterasi untuk loopnya, yakni sebanyak pnj (50)
printf “\r……. / pnj)) mencetak progres bar, mengisinya dengan karakter “ / ”, dan menampilkan persentase progresnya juga
sleep $(......* 0.9’) menunda progres bar agar prosesnya berjalan secara berkala dengan jeda secara random
echo “Done” sebagai pemanis untuk mencetak Done
;; merupakan pemisah case ini dengan case lain

Time
Singkat saja, untuk time, kamu memutuskan untuk membuat live clock yang menunjukkan tanggal, jam, menit dan detik.
Time.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, jam harus setidaknya menunjukkan tahun, bulan, tanggal, jam, menit, dan detik yang diperbaharui setiap detik.


#”Time” adalah trek ketiga
#dilanjut tampilan progres seperti sebelum-sebelumnya
while true adalah menginisiasi loopnya, agar program dijalankan terus menerus, do — done adalah batasan command yang harus dilakukan dalam loop

echo “=====” hanya sebagai tampilan tambahan biar tampilan waktu lebih terlihat bagus
date +’ %a %b %e %Y%n %H:%M:%S’ digunakan untuk menampilkan data waktu
%a: hari (disingkat), %: bulan (disingkat), %e: tanggal, %Y: tahun, %n: enter, %H: jam dalam format 24 jam, %M: menit, %S: detik
sleep 1 mempause terminal selama 1 detik
tput cuu 4 untuk menggeser output terminal sebanyak 4 baris ke atas, agar jam terlihat kena refresh tiap detiknya
;; merupakan pemisah satu case dengan case lain

Money
Kamu teringat dengan program yang sangat disukai oleh teman mu yang bernama cmatrix. Kamu pun memutuskan untuk membuat program yang mirip, tetapi mengganti isinya dengan simbol mata uang seperti $ € £ ¥ ¢ ₹ ₩ ₿ ₣ dan lain lainnya.
Money.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, matrix tersusun oleh simbol mata uang minimal 5 simbol yang berbeda.


#”Money” merupakan trek keempat
#dilanjut tampilan progres seperti sebelumnya


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

script tersebut merupakan referensi saya dalam membuat efek matrix ini. sc: BruXy: Matrix effect in BASH


Brain Damage
Untuk lagu Brain Damage, kamu mendapatkan ide untuk menampilkan proses yang sedang berjalan, seperti task manager tetapi menampilkannya di dalam terminal dan membuat agar task manager tersebut menampilkan data baru setiap detiknya.
Brain Damage.mp4
Diberikan kebebasan artistik, tidak harus sama persis dengan tampilan pada gif, tetapi untuk fungsionalitas, data harus sesuai dengan ps/top dan sejenisnya.


#”Playing” merupakan trek terakhir/kelima
#dilanjut dengan progres seperti sebelum-sebelumnya
while true membuat commandnya me-looping
do – done merupakan batas command apa yang harus dilakukan
echo “====” merupakan pemanis biar tampilan task manager kw lebih bagus
echo “USER…… COMMAND” adalah nama pada tabel (sortir proses)
ps -eo akan menampilkan proses yang sedang dijalankan, kemudian disortir melalui -o menjadi hanya menampilkan user, pid, cpu, mem, stime, command
“ | “ merupakan pipe untuk mengambil output sebelumnya menjadi input ke awk nya
awk ‘NR<==13’ membuat proses yang ditampilkan hanyalah 13 baris teratas



#” * “ merupakan semua trek selain 5 trek di atas (yang tidak ada di input). Misal kalau ngasih input “ ./dsotm --play=”Cinta Satu Malam” “, karena “Cinta Satu Malam” bukan trek yang ada di database, maka akan mencetak “maaf abangku,...... lain yah”

;; merupakan pemisah satu case dengan case lain
esac merupakan akhir dari case, untuk mengakhiri case
else adalah jika input yang diberi tidak sesuai kondisi-kondisi yang sudah ditentukan. Misal kita masukin “ ./dsotm play lagu dong “, maka akan muncul info “banh… format inputnya loh salah:( “
fi ada penanda akhir dari if
