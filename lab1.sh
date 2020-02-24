#!/bin/bash

echo "Kossenko Ekaterina"
echo "Lab_1"
echo "25 variant"

while true; do
        err=0
        if [[ $(whoami) == "root" ]]; then
                echo -n "Enter username: "
                read username

                if [[ $(id -u $username) ]]; then
                        echo "1 Password expire date"
                        echo "2 Change user shell"
                        echo "3 Change user home directory"
                        echo -n "Choose action [1-3]: "
                        read action
                        case $action in
                                1 )
                                        echo -n "Expire date:"
                                        read exp_date

                                        if [[ $exp_date =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
                                                usermod -e $exp_date $username
                                        else
                                                >&2 echo "Error! Wrong number"
                                                err=1
                                        fi
                                        ;;
                                2 )

                                        echo "1 /bin/sh"
                                        echo "2 /bin/bash"
                                        echo "3 /sbin/nologin"
                                        echo -n "User shell:"
                                        read u_shell
                                        case $u_shell in
                                                1 )
                                                        usermod -s /bin/sh $username
                                                        ;;
                                                2 )
                                                        usermod -s /bin/bash $username
 							;;
                                                3 )
                                                        usermod -s /sbin/nologin $username
                                                        ;;
                                                * )

                                                        >&2 echo "Error! Wrong number"
                                                        err=1
                                                        ;;
                                        esac
                                        ;;
                                3 )
                                        echo -n "Home dirtctory:"
                                        read h_dir

                                        mkdir -p $h_dir
                                        chown -R $username $h_dir
                                        usermod -d $h_dir $username
                                        ;;
                                * )
                                        >&2 echo "Error! Wrong number"
                                        err=1
                                        ;;
                        esac
                else
                        >&2 echo "Error! No such user"
                        err=1
                fi
        else
                >&2 echo "Error! You are not root"
                err=1
        fi

        echo -n "Do you want to continue? [y/n]"
        read ans
        if [[ $ans == "n" ]]; then
                exit $err
        fi

done
