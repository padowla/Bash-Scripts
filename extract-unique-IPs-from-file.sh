#!/bin/bash
# This scripts allow to extracts from a file all the UNIQUE IPs contained.
#i.e: the file DNS_query.txt contains this entry for each line:
#     11/18/2022 9:55:05 AM 1AA0 PACKET  00000214CA7DF330 UDP Rcv 192.168.167.84  306d   Q [0001   D   NOERROR] SRV    
#     (5)_ldap(4)_tcp(12)contoso(6)_sites(2)dc(6)_msdcs(3)isp(6)contoso(2)it(0)
#     11/18/2022 9:55:05 AM 1AA4 PACKET  00000214CA7E1DF0 UDP Rcv 192.168.167.88  5aa5   Q [0001   D   NOERROR] SRV    
#     (5)_ldap(4)_tcp(12)contoso(6)_sites(7)siderts(6)contoso(2)it(0)
#     11/18/2022 9:55:05 AM 1AA0 PACKET  00000214CA7E48B0 UDP Rcv 127.0.0.1       8caf   Q [0001   D   NOERROR] SRV    
#     (3)_gc(4)_tcp(9)contoso(3)isp(6)contoso(2)it(0)
#     11/18/2022 9:55:05 AM 1AA0 PACKET  00000214CA7E7370 UDP Rcv 127.0.0.1       8caf   Q [0001   D   NOERROR] SRV    
#     (3)_gc(4)_tcp(9)contoso(3)isp(6)contoso(2)it(0)
#     11/18/2022 9:55:05 AM 1AA0 PACKET  00000214CE52ED90 UDP Rcv 192.168.167.84  87e1   Q [0001   D   NOERROR] A      
# 
#Output:
# 192.168.167.84
# 192.168.167.88
# 127.0.0.1
#
# You can also exclude some IPs by addind it to the variable EXCLUDE_IP

EXCLUDE_IP="127.0.0.1"
INPUT_FILE="input.txt"
OUTPUT_FILE="output.txt"


grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' $INPUT_FILE | unique $OUTPUT_FILE
