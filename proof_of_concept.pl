#!/usr/bin/perl -w 

# This script will extract the target MAC address from a wake-on-lan 
# magic packet, sent to the local network segment's broadcast address

use IO::Socket;

# MAXLEN (below) could probably be much, much smaller (around 102, maybe?).
$MAXLEN = 262144;
$PORTNO = 10;

$sock = IO::Socket::INET->new(LocalHost => '127.0.0.255',LocalPort => $PORTNO, Proto => 'udp') or die "socket: $@";

print "Awaiting UDP messages on port $PORTNO\n";

$him="";
$datagram="";
while ($him=$sock->recv($datagram, $MAXLEN)) {
    $content=$header="";
    $content=unpack('H*',$datagram);
    $header=substr $content, 12, 12;
    print "macaddr = $header \n";
    print "full string = $content \n";
    print "length of datagram = ".length($datagram)."\n";

    # make a function call here, based on a match to the $macaddr

    # Example:
    # if ($macaddr eq "0000aabbccdd") {
    #    system("sudo -u tim docker start desk-001")
    #}
}