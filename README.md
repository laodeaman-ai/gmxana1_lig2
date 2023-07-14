# gmxana1_lig2
Analisis RMSD, RMSF, SASA dan GYRATION dari hasil MD protein-ligand menggunakan gromacs. System harus memiliki 2 molekul ligands.
Cara penggunaan:
1. Buat direktori kerja.
2. Tempatkan direktori-direktori kompleks hasil simulasi Gromacs ke dalam direktori kerja. Dalam setiap direktori merupakan 1 kompleks dengan segala file input-output simulasi gromacs, mulai dari preparasi sampai produksi.
3. Tempatkan file eksekusi (gmxana1_lig2.sh).
4. Pada Terminal Linux, jalankan perintah berikut: chmod a+x gmxana1_lig2.sh
5. Eksekusi analisis dengan perintah: ./gmxana1_lig2.sh
6. File output dalam bentuk rmsd ligand, rmsd protein, rmsf, sasa dan gyration dalam format .xvg tersimpan pada setiap direktori kompleks.
   
