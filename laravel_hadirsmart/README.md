# Laravel Project Setup

Ini adalah panduan untuk menjalankan proyek Laravel di lingkungan pengembangan lokal Anda.

## Prasyarat

Pastikan Anda telah menginstal:
- [PHP](https://www.php.net/downloads)
- [Composer](https://getcomposer.org/download/)
- [MySQL](https://dev.mysql.com/downloads/installer/) atau database lainnya yang didukung Laravel
- [Git](https://git-scm.com/downloads)

## Langkah-langkah Instalasi

1. **Clone Repository**
2. **Install Dependencies**  
```
composer install
```
3. **Salin File Environment**
```
cp .env.example .env
```
4. **Generate Application Key**
```
php artisan key:generate
```
5. "Setup Database"
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=nama_database
DB_USERNAME=username
DB_PASSWORD=password
```
6. **Migrasi dan Seed Database**
```
php artisan migrate:fresh --seed
```
7. **Menjalankan Server Lokal**
```
php artisan serve
```
### Setelah project Laravel berjalan di lokal, setup training face recognition:
1. **masuk ke folder python_app**
```
cd .\python_app\
```
2. **Run command di terminal**
   
```
pip install -r .\requirements.txt
```

#### Issue Python 1
Di Phython 3.10.*
Kamu perlu menginstall Dlib. (sesuaikan dengan versi python kamu)

1. Clone project ini:
```
https://github.com/z-mahmud22/Dlib_Windows_Python3.x
```
2. Masuk ke directory-nya:
```
cd Dlib_Windows_Python3.x
```
3. Jalankan perintah ini:
```
python -m pip install dlib-19.22.99-cp310-cp310-win_amd64.whl
```

#### References:
https://stackoverflow.com/questions/76629574/error-could-not-build-wheels-for-dlib-which-is-required-to-install-pyproject


#### Issue Python 2:
```
 WARNING: Failed to write executable - trying to use .deleteme logic
ERROR: Could not install packages due to an OSError: [WinError 2] The system cannot find the file specified: 'C:\\Python311\\Scripts\\face_detection.exe' -> 'C:\\Python311\\Scripts\\face_detection.exe.deleteme'
```
1 **Run Command**
```
pip install numpy --user
```
**or**
```
ppip install face_recognition
```

#### References:
https://stackoverflow.com/questions/66322049/could-not-install-packages-due-to-an-oserror-winerror-2-no-such-file-or-direc


#### Issue Python 3:
 - Terjadi pada library numpy V2 
```
Something wrong: Unsupported image type, must be 8bit gray or RGB image.
```
1 **Run Command**
```
pip uninstall numpy
```
```
pip install numpy==1.25.1
```

#### References:
https://stackoverflow.com/questions/48764485/dlib-face-detection-error-unsupported-image-type-must-be-8bit-gray-or-rgb-ima