<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pendaftaran UKM</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-yellow-600 via-pink-500 to-sky-400 min-h-screen flex items-center justify-center text-white">

    <div class="text-center space-y-6 px-4">
        <img 
    src="<?php echo e(asset('img/LOGO NF.jpg')); ?>" 
    alt="Logo NF" 
    class="mx-auto mb-10 rounded-full h-40 w-40 object-cover"
/>

    



        <h1 class="text-3xl md:text-5xl font-extrabold animate-pulse drop-shadow-lg">
            Pendaftaran UKM
        </h1>
        <p class="text-lg md:text-2xl max-w-2xl mx-auto">
            ✨ Ayo gabung dan eksplor komunitas seru di kampusmu!
        </p>

        <div class="flex flex-col md:flex-row justify-center items-center gap-4">
            <a href="<?php echo e(route('filament.adminku.auth.login')); ?>"
               class="border border-white text-white px-6 py-3 rounded-full font-bold hover:bg-white hover:text-pink-600 transition">
                Masuk Admin
            </a>
            <a href="<?php echo e(route('daftar.ukm')); ?>"
                class="bg-white border hover:border-white text-pink-600 px-6 py-3 rounded-full font-bold shadow hover:bg-transparent hover:text-white transition">
                Daftar UKM
            </a>
        </div>

        <footer class="mt-16 text-sm text-center text-white/100">
            <p>📍 Jalan Lenteng Agung Raya, Srengseng Sawah, Jagakarsa, Jakarta Selatan.</p>
            <p>📞 WhatsApp: 0812-3456-7890</p>
            &copy; <?php echo e(date('Y')); ?> STT-NF. Kelompok 5
        </footer>

    </div>

</body>
</html><?php /**PATH C:\xampp\htdocs\projek_ukm\resources\views/welcome.blade.php ENDPATH**/ ?>