---
- hosts: localhost
  remote_user: root
  tasks:
  - name: ensure apache is at the latest version
    yum: name=git
    become: yes
    become_method: sudo
  - name: clone my project
    git: repo=https://github.com/yeblank/spring-petclinic.git dest=~/sp
  - name: clone project devops scripts 
    git: repo=https://github.com/yeblank/DevOps-course.git dest=~/scripts update=no
  - name: get maven
    get_url: url=http://apache.spd.co.il/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz dest=~







