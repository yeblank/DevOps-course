---
- hosts: localhost
  remote_user: root
  tasks:
  - name: ensure apache is at the latest version
    yum: name=git
    become: yes
    become_method: sudo
  - name: clone my project
    git: repo=https://github.com/yeblank/spring-petclinic.git dest=~/sp update=no
  - name: clone project devops scripts 
    git: repo=https://github.com/yeblank/DevOps-course.git dest=~/scripts update=no
  - name: get maven
    get_url: url=http://apache.spd.co.il/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz dest=~

  - name: make maven dir
    file: path=/opt/maven state=directory mode=0755
    become: yes
    become_method: sudo
  - name: unzip
    unarchive: src=~/apache-maven-3.3.9-bin.tar.gz dest=/opt/maven
    become: yes
    become_method: sudo
    
    - name: set env m2_home
    lineinfile: dest=/home/ec2-user/.bash_profile regexp="^M2_HOME.*" line="M2_HOME=/opt/maven/apache-maven-3.3.9" insertbefore="^PATH="

