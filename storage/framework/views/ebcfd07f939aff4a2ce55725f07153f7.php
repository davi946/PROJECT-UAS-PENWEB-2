<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Pendaftaran UKM</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #ff6b6b, #ee5a24);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .header p {
            font-size: 1.1em;
            opacity: 0.9;
        }

        .form-container {
            padding: 40px;
        }

        .section {
            margin-bottom: 40px;
        }

        .section-title {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            font-size: 1.3em;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 0.95em;
        }

        .required {
            color: #e74c3c;
        }

        input,
        select,
        textarea {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1em;
            transition: all 0.3s ease;
            font-family: inherit;
        }

        input:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        .file-upload {
            position: relative;
            display: inline-block;
            width: 100%;
        }

        .file-upload input[type="file"] {
            position: absolute;
            opacity: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .file-upload-label {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 15px;
            border: 2px dashed #ccc;
            border-radius: 8px;
            background: #f9f9f9;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .file-upload-label:hover {
            border-color: #667eea;
            background: #f0f2ff;
        }

        .file-upload-label i {
            font-size: 1.2em;
            color: #667eea;
        }

        .preview-container {
            margin-top: 10px;
            text-align: center;
        }

        .preview-image {
            max-width: 150px;
            max-height: 150px;
            border-radius: 8px;
            border: 2px solid #e0e0e0;
        }

        .btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 15px 40px;
            border: none;
            border-radius: 50px;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }

        .btn-container {
            text-align: center;
            margin-top: 40px;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            margin-bottom: 20px;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: #764ba2;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .header h1 {
                font-size: 2em;
            }

            .form-container {
                padding: 20px;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-users"></i> Form Pendaftaran UKM</h1>
            <p>Isi data diri Anda dengan lengkap dan benar</p>
        </div>

        <div class="form-container">
            <a href="/" class="back-link">
                <i class="fas fa-arrow-left"></i> Kembali ke Halaman Utama
            </a>

            <form id="registrationForm">
                <!-- Data Pribadi -->
                <div class="section">
                    <div class="section-title">
                        <i class="fas fa-user"></i> Data Pribadi
                    </div>
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="nama_lengkap">Nama Lengkap <span class="required">*</span></label>
                            <input type="text" id="nama_lengkap" name="nama_lengkap" required maxlength="100">
                        </div>
                        <div class="form-group">
                            <label for="nim">NIM <span class="required">*</span></label>
                            <input type="text" id="nim" name="nim" required maxlength="20">
                        </div>
                        <div class="form-group">
                            <label for="email">Email <span class="required">*</span></label>
                            <input type="email" id="email" name="email" required maxlength="100">
                        </div>
                        <div class="form-group">
                            <label for="no_telp">No. Telepon <span class="required">*</span></label>
                            <input type="tel" id="no_telp" name="no_telp" required maxlength="20">
                        </div>
                        <div class="form-group">
                            <label for="jenis_kelamin">Jenis Kelamin <span class="required">*</span></label>
                            <select id="jenis_kelamin" name="jenis_kelamin" required>
                                <option value="">Pilih Jenis Kelamin</option>
                                <option value="L">Laki-laki</option>
                                <option value="P">Perempuan</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tanggal_lahir">Tanggal Lahir <span class="required">*</span></label>
                            <input type="date" id="tanggal_lahir" name="tanggal_lahir" required>
                        </div>
                        <div class="form-group full-width">
                            <label for="alamat">Alamat <span class="required">*</span></label>
                            <textarea id="alamat" name="alamat" required rows="3"
                                placeholder="Masukkan alamat lengkap Anda"></textarea>
                        </div>
                    </div>
                </div>

                <!-- Data Akademik -->
                <div class="section">
                    <div class="section-title">
                        <i class="fas fa-graduation-cap"></i> Data Akademik
                    </div>
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="angkatan">Angkatan <span class="required">*</span></label>
                            <input type="text" id="angkatan" name="angkatan" required maxlength="10"
                                placeholder="Contoh: 2023">
                        </div>
                        <div class="form-group">
                            <label for="program_studi">Program Studi <span class="required">*</span></label>
                            <input type="text" id="program_studi" name="program_studi" required maxlength="100"
                                placeholder="Contoh: Teknik Informatika">
                        </div>
                    </div>
                </div>

                <!-- Data Pendaftaran -->
                <div class="section">
                    <div class="section-title">
                        <i class="fas fa-clipboard-list"></i> Data Pendaftaran
                    </div>
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="ukm_id">UKM <span class="required">*</span></label>
                            <select id="ukm_id" name="ukm_id" required onchange="updateDivisi()">
                                <option value="">Pilih UKM</option>
                                <!-- Options akan diisi dengan JavaScript -->
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="divisi_id">Divisi <span class="required">*</span></label>
                            <select id="divisi_id" name="divisi_id" required disabled>
                                <option value="">Pilih UKM terlebih dahulu</option>
                            </select>
                        </div>
                        <div class="form-group full-width">
                            <label for="alasan_bergabung">Alasan Bergabung <span class="required">*</span></label>
                            <textarea id="alasan_bergabung" name="alasan_bergabung" required rows="4"
                                placeholder="Jelaskan alasan Anda ingin bergabung dengan UKM ini"></textarea>
                        </div>
                        <div class="form-group full-width">
                            <label for="foto">Foto <span class="required">*</span></label>
                            <div class="file-upload">
                                <input type="file" id="foto" name="foto" accept="image/*" required
                                    onchange="previewImage(this)">
                                <div class="file-upload-label">
                                    <i class="fas fa-camera"></i>
                                    <span>Klik untuk upload foto</span>
                                </div>
                            </div>
                            <div class="preview-container">
                                <img id="preview" class="preview-image" style="display: none;">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="btn-container">
                    <button type="submit" class="btn">
                        <i class="fas fa-paper-plane"></i> Daftar Sekarang
                    </button>
                </div>
                
            </form>
        </div>
    </div>

    <script>
        // Data dummy untuk UKM dan Divisi (sesuaikan dengan database Anda)
        const ukmData = [
            {
                id: 1,
                nama: "Paduan Suara Mahasiswa",
                divisi: [
                    { id: 1, nama: "Sopran" },
                    { id: 2, nama: "Alto" },
                    { id: 3, nama: "Tenor" },
                    { id: 4, nama: "Bass" }
                ]
            },
            {
                id: 2,
                nama: "Basket",
                divisi: [
                    { id: 5, nama: "Tim Putra" },
                    { id: 6, nama: "Tim Putri" }
                ]
            },
            {
                id: 3,
                nama: "Teater",
                divisi: [
                    { id: 7, nama: "Aktor" },
                    { id: 8, nama: "Sutradara" },
                    { id: 9, nama: "Penata Musik" },
                    { id: 10, nama: "Penata Panggung" }
                ]
            },
            {
                id: 4,
                nama: "Pecinta Alam",
                divisi: [
                    { id: 11, nama: "Pendakian" },
                    { id: 12, nama: "Penelusuran Gua" },
                    { id: 13, nama: "Konservasi" }
                ]
            }
        ];

        // Populate UKM dropdown
        function populateUKM() {
            const ukmSelect = document.getElementById('ukm_id');
            ukmData.forEach(ukm => {
                const option = document.createElement('option');
                option.value = ukm.id;
                option.textContent = ukm.nama;
                ukmSelect.appendChild(option);
            });
        }

        // Update divisi dropdown based on selected UKM
        function updateDivisi() {
            const ukmId = document.getElementById('ukm_id').value;
            const divisiSelect = document.getElementById('divisi_id');

            // Clear existing options
            divisiSelect.innerHTML = '<option value="">Pilih Divisi</option>';

            if (ukmId) {
                const selectedUKM = ukmData.find(ukm => ukm.id == ukmId);
                if (selectedUKM) {
                    selectedUKM.divisi.forEach(divisi => {
                        const option = document.createElement('option');
                        option.value = divisi.id;
                        option.textContent = divisi.nama;
                        divisiSelect.appendChild(option);
                    });
                    divisiSelect.disabled = false;
                }
            } else {
                divisiSelect.disabled = true;
            }
        }

        // Preview uploaded image
        function previewImage(input) {
            const preview = document.getElementById('preview');
            const file = input.files[0];

            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                };
                reader.readAsDataURL(file);
            } else {
                preview.style.display = 'none';
            }
        }

        // Handle form submission
        document.getElementById('registrationForm').addEventListener('submit', function (e) {
            e.preventDefault();

            // Collect form data
            const formData = new FormData(this);
            const data = {};

            for (let [key, value] of formData.entries()) {
                data[key] = value;
            }

            // Show success message (dalam implementasi nyata, kirim ke server)
            alert('Pendaftaran berhasil dikirim! Anda akan dihubungi melalui email atau telepon untuk informasi selanjutnya.');

            // Reset form
            this.reset();
            document.getElementById('preview').style.display = 'none';
            document.getElementById('divisi_id').disabled = true;
            document.getElementById('divisi_id').innerHTML = '<option value="">Pilih UKM terlebih dahulu</option>';
        });

        // Initialize page
        document.addEventListener('DOMContentLoaded', function () {
            populateUKM();
        });
    </script>
</body>

</html><?php /**PATH C:\xampp\htdocs\projek_ukm\resources\views/daftar-ukm.blade.php ENDPATH**/ ?>