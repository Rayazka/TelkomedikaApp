# Telkomedika App
Telkom Medika adalah aplikasi digital yang dirancang untuk mempermudah proses reservasi layanan kesehatan secara online. Aplikasi ini memungkinkan pengguna untuk melakukan pemesanan kunjungan ke fasilitas kesehatan tanpa harus datang langsung.

**✨ Fitur Utama:** 
📅 Reservasi Online:
-Pengguna dapat memesan layanan kesehatan (seperti konsultasi dokter) secara langsung dari aplikasi.

🗂️ Riwayat Reservasi:
-Menyimpan histori pemesanan layanan yang pernah dilakukan pengguna.

**💡 Teknologi yang Digunakan:**
Frontend: Dart
Backend: Dart
Database: Firebase
Authentication: Firebase Auth
Version Control: Git + GitHub

telkom-medika/
│
lib/
└── app/
    ├── modules/
    │   ├── auth/                   # Modul autentikasi
    │   │   ├── controllers/        # Controller login, register, dsb
    │   │   ├── services/           # Layanan  FirebaseAuth
    │   │   └── views/              # Tampilan UI untuk login/register
    │   │
    │   ├── get_started/            # Halaman splash screen
    │   │   └── views/              # Tampilan UI splash screen
    │   │
    │   ├── home/                   # Halaman beranda utama
    │   │   ├── controllers/        # Controller navigasi & data home
    │   │   └── views/              # Tampilan UI untuk home
    │   │      
    │   │
    │   ├── profile/                # Modul profil pengguna
    │   │   ├── controllers/        # Controller profile
    │   │   └── views/              # Tampilan UI untuk profile
    │   │
    │   └── reservation/            # Modul reservasi layanan kesehatan
    │       ├── controllers/
    │       └── views/              # Tampilan UI untuk reservation
    ├── firebase_options.dart       # Konfigurasi Firebase
    └── main.dart                   # Entry point aplikasi

## Installation

**Clone project ini**  
```bash
[https://github.com/Rayazka/TelkomedikaApp.git]
```

**Mendapatkan Dependency**  
```bash
flutter pub get
```

**Menjalankan Project**  
```bash
flutter run
```

**Akun Demo**  
```bash
Email: test@gmail.com
Password: 123456

// Atau dengan membuat akun baru menggunakan fitur sign up di aplikasi
```

## Screenshot
