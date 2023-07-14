# gmxana1_lig2
Analisis RMSD, RMSF, SASA dan GYRATION dari hasil MD protein-ligand menggunakan gromacs. System harus memiliki 2 molekul ligands.
Cara penggunaan:
1. Buat direktori kerja.
2. Tempatkan direktori-direktori kompleks hasil simulasi Gromacs ke dalam direktori kerja. Dalam setiap direktori merupakan 1 kompleks dengan segala file input-output simulasi gromacs, mulai dari preparasi sampai produksi.
3. Dalam script ini, grup ligand1 dan ligand2 berada pada nomor 13, dan 14. Perhatikan file index.ndx anda, apakah sesuai. Bila tidak silahkan lakukan penyesuaian.
4. Begitu pula grup-grup yang hendak anda analisis, silahkan lakukan penyesuaian pada file .sh sesuai kebutuhan Anda.
5. Tempatkan file eksekusi (gmxana1_lig2.sh).
6. Pada Terminal Linux, jalankan perintah berikut: chmod a+x gmxana1_lig2.sh
7. Eksekusi analisis dengan perintah: ./gmxana1_lig2.sh
8. File output dalam bentuk rmsd ligand, rmsd protein, rmsf, sasa dan gyration dalam format .xvg tersimpan pada setiap direktori kompleks.
   
