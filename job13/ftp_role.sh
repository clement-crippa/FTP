# Définitions de la localisation du fichier a lire
MY_INPUT='./FTP_Userlist.csv'
declare -a A_FIRSTNAME
declare -a A_ROLE
declare -a A_PASSWORD
while IFS=, read -r COL1 COL2 COL3; do
    A_FIRSTNAME+=("$COL1")
    A_ROLE+=("$COL3")
    A_PASSWORD+=("$COL2")
done <"$MY_INPUT"
# Créer les utilisateurs selon les donnée du fichier CSV
for index in "${!A_FIRSTNAME[@]}"; do
   sudo  useradd -m "${A_FIRSTNAME[$index]}" -s /bin/bash -p "$(echo "${A_PASSWORD[$index]}" | openssl passwd -1 -stdin)"
   sudo chmod 700 /home/"${A_FIRSTNAME[$index]}" ##Sécurité pour empêcher les autres utilisateurs créer via ce script d'accéder au home des autres utilisateurs via une console
# Ajoute sudo au utilisateur si leur rôle dans le CSV est Admin
if [ "${A_ROLE[$index]}" == Admin ]
then
 sudo usermod -aG sudo "${A_FIRSTNAME[$index]}"
fi
done
