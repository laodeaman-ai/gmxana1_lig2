#!/bin/bash
# ANALISIS RMSD, RMSF, SASA DAN GIRASI

# Input dari pengguna dengan nilai default
read -p "Masukkan nilai input 1 [Default: 1]: " center_input1
center_input1=${center_input1:-1}

read -p "Masukkan nilai input 2 [Default: 0]: " center_input2
center_input2=${center_input2:-0}

read -p "Masukkan nilai input 3_1 [Default: 1]: " rmsd_receptor_input1
rmsd_receptor_input1=${rmsd_receptor_input1:-1}

read -p "Masukkan nilai input 3_2 [Default: 1]: " rmsd_receptor_input2
rmsd_receptor_input2=${rmsd_receptor_input2:-1}

read -p "Masukkan nilai input 4_1 [Default: 14]: " rmsd_lig14_input1
rmsd_lig14_input1=${rmsd_lig14_input1:-14}

read -p "Masukkan nilai input 4_2 [Default: 14]: " rmsd_lig14_input2
rmsd_lig14_input2=${rmsd_lig14_input2:-14}

read -p "Masukkan nilai input 5_1 [Default: 15]: " rmsd_lig15_input1
rmsd_lig15_input1=${rmsd_lig15_input1:-15}

read -p "Masukkan nilai input 5_2 [Default: 15]: " rmsd_lig15_input2
rmsd_lig15_input2=${rmsd_lig15_input2:-15}

read -p "Masukkan nilai input 6 [Default: 4]: " rmsf_input
rmsf_input=${rmsf_input:-4}

read -p "Masukkan nilai input 7 [Default: 1]: " sasa_input
sasa_input=${sasa_input:-1}

read -p "Masukkan nilai input 8 [Default: 5]: " gyration_input
gyration_input=${gyration_input:-5}

for dir in */; do
    cd "$dir"
    
    # Menjalankan perintah gmx dengan input yang telah diatur
    echo -e "$center_input1\n$center_input2" | gmx trjconv -s md.tpr -f md.xtc -n index.ndx -o md_center.xtc -center -pbc mol -ur compact && \
    echo -e "$center_input1\n$center_input2" | gmx trjconv -s md.tpr -f md_center.xtc -n index.ndx -o md_center_fit.xtc -fit rot+trans && \
    echo -e "$rmsd_receptor_input1\n$rmsd_receptor_input2" | gmx rms -s md.tpr -f md.xtc -n index.ndx -tu ns -o rmsd_receptor.xvg && \
    echo -e "$rmsd_lig14_input1\n$rmsd_lig14_input2" | gmx rms -s md.tpr -f md.xtc -n index.ndx -tu ns -o rmsd_lig14.xvg && \
    echo -e "$rmsd_lig15_input1\n$rmsd_lig15_input2" | gmx rms -s md.tpr -f md.xtc -n index.ndx -tu ns -o rmsd_lig15.xvg && \
    echo -e "$rmsf_input" | gmx rmsf -f md_center_fit.xtc -s md.tpr -o rmsf.xvg -res && \
    echo -e "$sasa_input" | gmx sasa -s md.tpr -f md_center_fit.xtc -o sasa.xvg && \
    echo -e "$gyration_input" | gmx gyrate -s md.tpr -f md_center_fit.xtc -o gyration.xvg && \
    cd ..
done

echo Successfully
echo This script written by La Ode Aman, laode_aman@ung.ac.id, Universitas Negeri Gorontalo
