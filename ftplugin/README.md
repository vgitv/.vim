Ce dossier contient des fichiers nommés de la forme :
langage.vim (en fonction du langage auquel il s'applique).

Cela peut permettre de définir des comportement de vim en fonction du langage édité. Typiquement, les lignes du .vimrc qui sont propre à un langage en particulier doivent être mises dans un fichier de ce dossier et non dans le .vimrc.

ATTENTION : par défaut les fichiers c.vim et cpp.vim sont chargés pour les fichiers C et C++ (les deux à la fois). Pour empêcher ce comportement, on commence ces fichier par vérifier explicitement l'extension et quitter le script si on n'est pas dans le bon langage. ATTENTION : pour un fichier .h, vim ne peut pas savoir si c'est un fichier C ou C++. Une solution peut être de définir le type manuellement à la fin des commandes :
:setlocal filetype=c

Voir ~/.vim/after/ftplugin/ pour les fichiers qui sont chargés en dernier (et qui écrasent les autres configurations)
