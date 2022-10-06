*** Settings ***
Library    Process
Resource    systems-robot.keywords.Process_Keywords.robot
Force Tags    package_manager

*** Test Cases ***
Test Yum
    [Tags]    yum    rpm    redhat    rhel    centos    alma    rocky
    Process Should Succeed    yum    makecache
    Process Should Succeed    yum    -y    upgrade
    Process Should Succeed    yum    install    httpd

Test Apt
    [Tags]    apt    deb    debian    ubuntu
    Process Should Succeed    DEBIAN_FRONTEND=noninteractive    apt    update
    Process Should Succeed    apt    -o    Dpkg::Options::="--force-confold"    dist-upgrade    -q    -y    --force-yes
    Process Should Succeed    apt    -o    Dpkg::Options::="--force-confold"    install    fortune-mod    -q    -y    --force-yes
