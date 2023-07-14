#!/bin/bash
# ANALISIS RMSD, RMSF, SASA DAN GIRASI
for dir in */; do
    cd "$dir"
    echo -e "1\n0" | gmx trjconv -s md.tpr -f md.xtc -n index.ndx -o md_center.xtc -center -pbc mol -ur compact && \ # centering
    echo -e "1\n0" | gmx trjconv -s md.tpr -f md_center.xtc -n index.ndx -o md_center_fit.xtc -fit rot+trans && \ # fitting
    echo -e "1\n1" | gmx rms -s md.tpr -f md.xtc -n index.ndx -tu ns -o rmsd_receptor.xvg && \ # rmsd receptor
    echo -e "14\n14" | gmx rms -s md.tpr -f md.xtc -n index.ndx -tu ns -o rmsd_lig14.xvg && \ # rmsd ligand #1
    echo -e "15\n15" | gmx rms -s md.tpr -f md.xtc -n index.ndx -tu ns -o rmsd_lig15.xvg && \ # rmsd ligand #2
    echo -e "4" | gmx rmsf -f md_center_fit.xtc -s md.tpr -o rmsf.xvg -res && \ # sasa
    echo -e "1" | gmx sasa -s  md.tpr -f md_center_fit.xtc -o sasa.xvg && \ # sasa
    echo -e "5" | gmx gyrate -s md.tpr -f md_center_fit.xtc -o gyration.xvg	&& \ # gyration
    cd ..
done

echo Succesfully
echo This script written by La Ode Aman, laode_aman@ung.ac.id, Universitas Negeri Gorontalo
