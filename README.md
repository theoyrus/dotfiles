```
██████╗░░█████╗░████████╗███████╗██╗██╗░░░░░███████╗░██████╗
██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║██║░░░░░██╔════╝██╔════╝
██║░░██║██║░░██║░░░██║░░░█████╗░░██║██║░░░░░█████╗░░╚█████╗░
██║░░██║██║░░██║░░░██║░░░██╔══╝░░██║██║░░░░░██╔══╝░░░╚═══██╗
██████╔╝╚█████╔╝░░░██║░░░██║░░░░░██║███████╗███████╗██████╔╝
╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░░░░░╚═╝╚══════╝╚══════╝╚═════╝░
```

Backup file konfigurasi yang ada di mesin saya, bersifat subjektif sesuai dengan kebutuhan saya. Disusun menggunakan GNU/stow

# Pemasangan
---

Mungkin jika anda belum mengetahui GNU/stow, silahkan mencari lebih detail di google. 

Secara singkat, GNU/stow merupakan alat untuk mengelola `symlink`, sehingga memudahkan pengguna sistem untuk mengaitkan berkas alih-alih menyalin berkas secara manual dan mengetik perintah `symlink` lengkap dengan `path`.

### Pemasangan GNU/stow

Jika anda menggunakan Mac, install melalui `Homebrew` :

```
$ brew install stow
```

Jika anda pengguna Ubuntu atau turunannya, install melalui `apt` :

```
$ sudo apt install stow
```

### Pemasangan berkas `dotfiles` menggunakan GNU/stow

> saran: sebaiknya letakkan repositori ini ke direktori `$HOME` sistem anda, hal ini akan mempermudah anda dalam mengelola repositori dotfiles

> sebagai contoh saja, misal anda letakkan di direktori `$HOME/dotfiles`

> namun kembali lagi, dotfiles merupakan preferensi tiap pengguna, tidak ada peraturan wajib. Anda bebas mengaturnya 😊

Setelah anda `clone` repositori ini, menggunakan `terminal` pindah/masuk ke direktori repositori ini kemudian sebagai contoh saya akan memasang berkas konfigurasi dari `zsh shell (.zshrc)`, berikut perintahnya:

```
$ stow zsh
```

maka `stow` akan membuat sebuah `symlink` sesuai direktori yang diatur dari konfigurasi di repositori dotfiles. Silahkan anda cek apakah berkas `.zshrc` sudah berada di direktori `$HOME` dengan perintah:

```
$ ls -la ~ | grep zsh
```

```
-rw-------   1 theoyrus  staff   1241 Sep 27 19:57 .zsh_history
lrwxr-xr-x   1 theoyrus  staff     19 Sep 27 20:08 .zshrc -> dotfiles/zsh/.zshrc
```

jika menampilkan seperti berikut `.zshrc -> dotfiles/zsh/.zshrc` maka `stow` berhasil memasang `symlink` berkas konfigurasi yang kita inginkan.

# Memasang dotfiles milik anda sendiri
---

Mungkin anda ingin menyesuaikan dotfiles milik anda sendiri, dengan menggunakan `stow` hal itu menjadi mudah.

Secara garis besar dalam penyusunan dotfiles, kita akan memindahkan berkas konfigurasi dari sebuah `tool` ke dalam repositori dotfiles yang di dalamnya terdapat direktori `tool` tersebut, kemudian berkas konfigurasi tersebut kita atur menggunakan `symlink`.

Misalkan saja anda ingin membuat dotfiles untuk konfigurasi `bash shell (.bashrc)`, setelah memiliki repositori dotfiles. 

``` 
$ mkdir -p ~/$HOME/dotfiles/bash
```

Perintah mkdir -p diatas akan mempersingkat pembuatan direktori bertingkat atau `recursive` jika belum ada.

Anggap anda sudah mempunyai direktori untuk menyimpan dotfiles `bash`, misalkan di `$HOME/dotfiles/bash`. Pindahkan berkas konfigurasi `.bashrc` ke dalam direktori dotfiles

```
$ mv ~/.bashrc ~/dotfiles/bash/
```

kemudian masuk ke direktori dotfiles, 

```
$ cd ~/dotfiles
```

kita atur ulang agar `.bashrc` tetap ada di `$HOME/.bashrc`, sebenarnya bisa dengan `symlink` seperti biasa:

```
$ ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
```

namun jika kita pakai `stow`, bandingkan dengan perintah berikut:

```
$ stow bash
```

jauh lebih singkat bukan? 😁

# Selamat mencoba 🙃
