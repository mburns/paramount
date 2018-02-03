FROM zuazo/chef-local:debian-7

COPY . /tmp/paramount
RUN berks vendor -b /tmp/paramount/Berksfile $COOKBOOK_PATH
RUN chef-client -r "recipe[apt],recipe[paramount]"

# CMD ["apache2", "-D", "FOREGROUND"]