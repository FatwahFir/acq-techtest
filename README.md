# Flutter Developer Technical Test

## 📌 Deskripsi
Buatlah aplikasi Flutter sederhana yang berkomunikasi dengan dummy backend dari [Reqres.in](https://reqres.in/) untuk melakukan **GET** dan **POST** request. Aplikasi harus menggunakan state management (bebas menggunakan apapun, namun penggunaan GetX dengan GetX Pattern akan menjadi nilai tambah).

## 📋 Spesifikasi Pengerjaan
1. **Clone repository ini** ke lokal Anda.
2. **Buat branch baru** dengan nama sesuai nama Anda. Contoh:
   ```sh
   git checkout -b john-doe
   ```
3. Kerjakan task sesuai spesifikasi di bawah.
4. Setelah selesai, **push ke branch masing-masing** dan buat pull request untuk pengumpulan.

## 🚀 Spesifikasi Aplikasi

### 1. Halaman Login
- Buatlah halaman login dengan dua input field:
  - **Email**
  - **Password**
- Gunakan API berikut untuk melakukan **POST** request saat tombol login ditekan:
  ```
  POST https://reqres.in/api/login
  Body:
  {
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
  }
  ```
- Jika login berhasil, simpan token yang didapat dari response dan arahkan user ke halaman berikutnya.

### 2. Halaman Daftar Pengguna
- Setelah login sukses, tampilkan daftar pengguna dari API berikut:
  ```
  GET https://reqres.in/api/users?page=1
  ```
- Tampilkan data pengguna dalam bentuk list (ListView/GridView) yang minimal menampilkan **nama, email, dan avatar**.

### 3. Tambah Pengguna Baru
- Buatlah form untuk menambahkan pengguna baru dengan input:
  - **Nama**
  - **Pekerjaan**
- Gunakan API berikut untuk melakukan **POST** request ketika tombol submit ditekan:
  ```
  POST https://reqres.in/api/users
  Body:
  {
    "name": "Nama Kandidat",
    "job": "Flutter Developer"
  }
  ```
- Tampilkan response dari API setelah berhasil menambahkan user.

## 🎯 Kriteria Penilaian
✅ Penggunaan state management (**GetX akan menjadi nilai plus**).
✅ Struktur project yang bersih dan mengikuti best practices (modular, GetX pattern jika digunakan).
✅ Implementasi HTTP request yang benar (**Dio atau http package**).
✅ Penanganan error dan validasi form (contoh: jika login gagal, tampilkan pesan error).
✅ UI yang rapi dan fungsional (tidak perlu terlalu kompleks, yang penting clean dan user-friendly).

## 📌 Pengumpulan
1. Pastikan semua kode sudah diuji sebelum dikumpulkan.
2. Push branch Anda ke repository ini:
   ```sh
   git push origin nama-branch-anda
   ```
3. Buat **Pull Request (PR)** ke branch `main`.

## ⏳ Batas Waktu
Harap selesaikan dalam **waktu 2 jam** setelah menerima tugas ini.

Selamat mengerjakan dan semoga sukses! 🚀

