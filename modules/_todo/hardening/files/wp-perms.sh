#!/bin/bash

###
### ATTENTION! ATTENTION! ATTENTION!
###     This file is managed by Puppet.
###     Any local modifications will be lost in the next puppet run.
### ATTENTION! ATTENTION! ATTENTION!
###

function info(){
    # informacao sobre o que o comando vai fazer
    echo -ne "\n\n[$(date +%T)] $1\n" | tee -a "$3"
    # mostra o comando
    echo -ne "[$(date +%T)] $2\n" | tee -a "$3"
}

# vars
LOG="/var/log/wp-perms.log"
WP_PATH="$1"
UPLOAD_PATH="$WP_PATH""wp-content/uploads/"

# fix para encontrar carateres UTF-8 (ç,é, etc ...)
LANG=pt_br.UTF-8
export LANG

# check params
if [[ $# -eq 0 ]]; then
    echo "usage: $0 <wordpress-path>"
    echo -ne "[ERRO] $0 numero de parametros incorretos.\n\n" | tee -a $LOG
    exit 1
fi

# check wp path
if [[ ! -f "$WP_PATH/wp-config.php" ]]; then
    echo "usage: $0 <wordpress-path>"
    echo -ne "[ERRO] $0 este nao e um PATH de Wordpress valido.\n\n" | tee -a $LOG
    exit 1
fi

info "Inicio" "date" $LOG
date

MSG="Removendo plugin padrao hello.php"
info "$MSG" "[ -e $WP_PATH/wp-content/plugins/hello.php ] && rm -fv $WP_PATH/wp-content/plugins/hello.php" $LOG
if [ -e $WP_PATH/wp-content/plugins/hello.php ]; then
    rm -fv $WP_PATH/wp-content/plugins/hello.php | tee -a $LOG
    [ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG
fi

MSG="Removendo arquivo padrao readme.html"
info "$MSG" "[ -e $WP_PATH/readme.html ] && rm -fv $WP_PATH/readme.html" $LOG
if [ -e "$WP_PATH"/readme.html ]; then
    rm -fv "$WP_PATH"/readme.html | tee -a $LOG
    [ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG
fi

MSG="Remover todos os links simbolicos"
info "$MSG" "find $WP_PATH/ -type l -exec rm -fv {} \\;" $LOG
find $WP_PATH/ -type l -exec rm -fv {} \; | tee -a $LOG
[ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG

MSG="Definir dono root e grupo apache"
#info "$MSG" "chown -c -R root:apache $WP_PATH" $LOG
#chown -c -R root:apache "$WP_PATH" | tee -a $LOG
info "$MSG" "find $WP_PATH \( ! -user root -o ! -group apache \) -exec chown -c root:apache {} \\;" $LOG
find "$WP_PATH" \( ! -user root -o ! -group apache \) -exec chown -c root:apache {} \; | tee -a $LOG
[ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG

MSG="Definir permissoes do diretorio upload, (rw-r-----), 2770"
info "$MSG" "[ -d $UPLOAD_PATH ] && chmod 2765 $UPLOAD_PATH && chown -cR apache: $UPLOAD_PATH" $LOG
[ -d $UPLOAD_PATH ] && chmod 2765 $UPLOAD_PATH && chown -cR apache: $UPLOAD_PATH
[ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG

MSG="Definir permissoes de todos os arquivos (rw-r-----), 0640, mascara 0026"
info "$MSG" "find $WP_PATH/ \\( ! -regex '.*wp-content/blogs\\.dir.*' ! -regex '.*wp-content/themes.*' ! -regex '.*wp-content/plugins.*' \\) -type f -exec chmod -c 0640 {} \\;" $LOG
find $WP_PATH/ \( ! -regex '.*wp-content/blogs\.dir.*' ! -regex '.*wp-content/themes.*' ! -regex '.*wp-content/plugins.*' \) -type f -exec chmod -c 0640 {} \; | tee -a $LOG
[ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG

MSG="Definir permissoes de todos os diretorios (rwxr-x----), 0750, mascara 0027"
info "$MSG" "find $WP_PATH/ \\( ! -regex '.*wp-content/blogs\\.dir.*' ! -regex '.*wp-content/themes.*' ! -regex '.*wp-content/plugins.*' \\) -type d -exec chmod -c 0750 {} \\;" $LOG
find "$WP_PATH"/ \( ! -regex '.*wp-content/blogs\.dir.*' ! -regex '.*wp-content/themes.*' ! -regex '.*wp-content/plugins.*' \) -type d -exec chmod -c 0750 {} \; | tee -a $LOG
[ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG

MSG="Removendo permissao de suid, sgid e stick bit de todos os arquivos e diretorios"
info "$MSG" "find $WP_PATH/ \\( ! -regex '.*wp-content/blogs\\.dir.*' ! -regex '.*wp-content/themes.*' ! -regex '.*wp-content/plugins.*' \\) -exec chmod -c -s {} \\;" $LOG
find $WP_PATH/ \( ! -regex '.*wp-content/blogs\.dir.*' ! -regex '.*wp-content/themes.*' ! -regex '.*wp-content/plugins.*' \) -exec chmod -c -s {} \; | tee -a $LOG
[ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG

MSG="Escrita e sticky bit para o grupo apache no diretório blogs.dir (recursivo)"
info "$MSG" "find $WP_PATH/wp-content/blogs.dir/ -type d -exec chmod -c 2770 {} \\;" $LOG
find "$WP_PATH"/wp-content/blogs.dir/ -type d -exec chmod -c 2770 {} \; | tee -a $LOG
[ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG

MSG="Permissao de escrita para usuario root e grupo apache em todos os arquivos do blogs.dir"
info "$MSG" "find $WP_PATH/wp-content/blogs.dir/ -type f -exec chmod -c 0660 {} \\;" $LOG
find "$WP_PATH"/wp-content/blogs.dir/ -type f -exec chmod -c 0660 {} \; | tee -a $LOG
[ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG

MSG="Aplicando sticky bit no diretorio themes (recursivo)"
info "$MSG" "find $WP_PATH/wp-content/themes/ -type d -exec chmod -c 2750 {} \\;" $LOG
find "$WP_PATH"/wp-content/themes/ -type d -exec chmod -c 2750 {} \; | tee -a $LOG
[ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG

MSG="Aplicando sticky bit no diretorio plugins (recursivo)"
info "$MSG" "find $WP_PATH/wp-content/plugins/ -type d -exec chmod -c 2750 {} \\;" $LOG
find "$WP_PATH"/wp-content/plugins/ -type d -exec chmod -c 2750 {} \; | tee -a $LOG
[ ${PIPESTATUS[0]} -ne 0 ] && echo -ne "[$(date +%T)][ ERRO ] $MSG\n\n" | tee -a $LOG


if [ "$2" == "rm" ]; then
    # se espeficiado "rm" como segundo parametro na linha de comando, o find ignora as extensoes .hardening e as remove
    MSG="Remocao por exclusão as extensões abaixo php,jpg,xml,js,css,gif,png,htm,html,swf,meta,jpeg,po,mo,pot,.htaccess,pdf,bmp,import,mp3,phtml,wmv,ttf,ini,inc,xap,pem"
    info "$MSG" 'find '$WP_PATH'/ -type f \( ! -iname "*.php" ! -iname "*.jpg" ! -iname "*.xml" ! -iname "*.js" ! -iname "*.css" ! -iname "*.gif" ! -iname "*.png" ! -iname "*.htm" ! -iname "*.html" ! -iname "*.swf" ! -iname "*.meta" ! -iname "*.jpeg" ! -iname "*.po" ! -iname "*.mo" ! -iname "*.pot" ! -iname ".htaccess" ! -iname "*.pdf" ! -iname "*.bmp" ! -iname "*.import" ! -iname "*.mp3" ! -iname "*.phtml" ! -iname "*.wmv" ! -iname "*.ttf" ! -iname "*.inc" ! -iname "*.ini" ! -iname "*.xap" ! -iname "*.pem" ! -iname "wp-tinymce.js.gz" ! -iname "*.wav" ! -iname "*.wma" ! -iname "robots.txt" ! -iname "*.mov" ! -iname "*.avi" ! -iname "*.eot" ! -iname "*.otf" ! -iname "*.json" ! -iname "*.gdf" ! -iname "*.shtml" ! -iname "*.svg" ! -iname "*.woff" ! -iname "*.fla" ! -iname "*.flv" ! -iname "*.psd" ! -iname "*.ico" \) -exec rm -fv {} \;' $LOG
    find "$WP_PATH"/ -type f \( ! -iname "*.php" ! -iname "*.jpg" ! -iname "*.xml" ! -iname "*.js" ! -iname "*.css" ! -iname "*.gif" ! -iname "*.png" ! -iname "*.htm" ! -iname "*.html" ! -iname "*.swf" ! -iname "*.meta" ! -iname "*.jpeg" ! -iname "*.po" ! -iname "*.mo" ! -iname "*.pot" ! -iname ".htaccess" ! -iname "*.pdf" ! -iname "*.bmp" ! -iname "*.import" ! -iname "*.mp3" ! -iname "*.phtml" ! -iname "*.wmv" ! -iname "*.ttf" ! -iname "*.inc" ! -iname "*.ini" ! -iname "*.xap" ! -iname "*.pem" ! -iname "wp-tinymce.js.gz" ! -iname "*.wav" ! -iname "*.wma" ! -iname "robots.txt" ! -iname "*.mov" ! -iname "*.avi" ! -iname "*.eot" ! -iname "*.otf" ! -iname "*.json" ! -iname "*.gdf" ! -iname "*.shtml" ! -iname "*.svg" ! -iname "*.woff" ! -iname "*.fla" ! -iname "*.flv" ! -iname "*.psd" ! -iname "*.ico" \) -exec rm -fv {} \; | tee -a $LOG
elif [ "$2" == "dry-run" ]; then
    # ao encontrar os arquivos diferentes dos arquivos listados mostrar a lista de arquivos que seriam modificados
    MSG="Renomeando arquivos por exclusão as extensões hardening,php,jpg,xml,js,css,gif,png,htm,html,swf,meta,jpeg,po,mo,pot,.htaccess,pdf,bmp,import,mp3,phtml,wmv,ttf,ini,inc,xap,pem"
    info "$MSG" 'find '$WP_PATH'/ -type f \( ! -iname "*.php" ! -iname "*.jpg" ! -iname "*.xml" ! -iname "*.js" ! -iname "*.css" ! -iname "*.gif" ! -iname "*.png" ! -iname "*.htm" ! -iname "*.html" ! -iname "*.swf" ! -iname "*.meta" ! -iname "*.jpeg" ! -iname "*.po" ! -iname "*.mo" ! -iname "*.pot" ! -iname ".htaccess" ! -iname "*.pdf" ! -iname "*.bmp" ! -iname "*.import" ! -iname "*.mp3" ! -iname "*.phtml" ! -iname "*.wmv" ! -iname "*.ttf" ! -iname "*.inc" ! -iname "*.ini" ! -iname "*.xap" ! -iname "*.pem" ! -iname "*.hardening" ! -iname "wp-tinymce.js.gz" ! -iname "*.wav" ! -iname "*.wma" ! -iname "robots.txt" ! -iname "*.mov" ! -iname "*.avi" ! -iname "*.eot" ! -iname "*.otf" ! -iname "*.json" ! -iname "*.gdf" ! -iname "*.shtml" ! -iname "*.svg" ! -iname "*.woff" ! -iname "*.fla" ! -iname "*.flv" ! -iname "*.psd" ! -iname "*.ico" \)' $LOG
    find "$WP_PATH"/ -type f \( ! -iname "*.php" ! -iname "*.jpg" ! -iname "*.xml" ! -iname "*.js" ! -iname "*.css" ! -iname "*.gif" ! -iname "*.png" ! -iname "*.htm" ! -iname "*.html" ! -iname "*.swf" ! -iname "*.meta" ! -iname "*.jpeg" ! -iname "*.po" ! -iname "*.mo" ! -iname "*.pot" ! -iname ".htaccess" ! -iname "*.pdf" ! -iname "*.bmp" ! -iname "*.import" ! -iname "*.mp3" ! -iname "*.phtml" ! -iname "*.wmv" ! -iname "*.ttf" ! -iname "*.inc" ! -iname "*.ini" ! -iname "*.xap" ! -iname "*.pem" ! -iname "*.hardening" ! -iname "wp-tinymce.js.gz" ! -iname "*.wav" ! -iname "*.wma" ! -iname "robots.txt" ! -iname "*.mov" ! -iname "*.avi" ! -iname "*.eot" ! -iname "*.otf" ! -iname "*.json" ! -iname "*.gdf" ! -iname "*.shtml" ! -iname "*.svg" ! -iname "*.woff" ! -iname "*.fla" ! -iname "*.flv" ! -iname "*.psd" ! -iname "*.ico" \) | tee -a $LOG
else
    # ao encontrar os arquivos diferentes dos arquivos listados, mudar o nome do arquivo acrescentando a extensao .hardening
    MSG="Renomeando arquivos por exclusão as extensões hardening,php,jpg,xml,js,css,gif,png,htm,html,swf,meta,jpeg,po,mo,pot,.htaccess,pdf,bmp,import,mp3,phtml,wmv,ttf,ini,inc,xap,pem"
    info "$MSG" 'find '$WP_PATH'/ -type f \( ! -iname "*.php" ! -iname "*.jpg" ! -iname "*.xml" ! -iname "*.js" ! -iname "*.css" ! -iname "*.gif" ! -iname "*.png" ! -iname "*.htm" ! -iname "*.html" ! -iname "*.swf" ! -iname "*.meta" ! -iname "*.jpeg" ! -iname "*.po" ! -iname "*.mo" ! -iname "*.pot" ! -iname ".htaccess" ! -iname "*.pdf" ! -iname "*.bmp" ! -iname "*.import" ! -iname "*.mp3" ! -iname "*.phtml" ! -iname "*.wmv" ! -iname "*.ttf" ! -iname "*.inc" ! -iname "*.ini" ! -iname "*.xap" ! -iname "*.pem" ! -iname "*.hardening" ! -iname "wp-tinymce.js.gz" ! -iname "*.wav" ! -iname "*.wma" ! -iname "robots.txt" ! -iname "*.mov" ! -iname "*.avi" ! -iname "*.eot" ! -iname "*.otf" ! -iname "*.json" ! -iname "*.gdf" ! -iname "*.shtml" ! -iname "*.svg" ! -iname "*.woff" ! -iname "*.fla" ! -iname "*.flv" ! -iname "*.psd" ! -iname "*.ico" \) -exec mv -v {} {}.hardening \;' $LOG
    find "$WP_PATH"/ -type f \( ! -iname "*.php" ! -iname "*.jpg" ! -iname "*.xml" ! -iname "*.js" ! -iname "*.css" ! -iname "*.gif" ! -iname "*.png" ! -iname "*.htm" ! -iname "*.html" ! -iname "*.swf" ! -iname "*.meta" ! -iname "*.jpeg" ! -iname "*.po" ! -iname "*.mo" ! -iname "*.pot" ! -iname ".htaccess" ! -iname "*.pdf" ! -iname "*.bmp" ! -iname "*.import" ! -iname "*.mp3" ! -iname "*.phtml" ! -iname "*.wmv" ! -iname "*.ttf" ! -iname "*.inc" ! -iname "*.ini" ! -iname "*.xap" ! -iname "*.pem" ! -iname "*.hardening" ! -iname "wp-tinymce.js.gz" ! -iname "*.wav" ! -iname "*.wma" ! -iname "robots.txt" ! -iname "*.mov" ! -iname "*.avi" ! -iname "*.eot" ! -iname "*.otf" ! -iname "*.json" ! -iname "*.gdf" ! -iname "*.shtml" ! -iname "*.svg" ! -iname "*.woff" ! -iname "*.fla" ! -iname "*.flv" ! -iname "*.psd" ! -iname "*.ico" \) -exec mv -v {} {}.hardening \;

fi

info "Fim" "date" $LOG
date
