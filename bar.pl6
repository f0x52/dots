#!/usr/bin/env perl6

use v6;
my $fgcolor = "#d9e1e8"; #ddd
my $accentcolor = "#9baec8"; #5b95ae

my $fg = "%\{F$fgcolor\}";
my $accent = "%\{F$accentcolor\}";

sub battery() {
    my $output;
    my @batteries = dir "/sys/class/power_supply";
    
    my $ac = @batteries.grep: /AC/;
    my $charging = slurp($ac ~ "/online") == 1;
    $output = $accent ~ "{ $charging ?? "" !! "" }" ~ $fg;
    
    for @batteries.grep(/BAT/) -> $battery {
        my $capacity = chomp slurp $battery ~ "/capacity";
        $output ~= $capacity ~ "% ";
    }
    return $output;
}

sub nowplaying() {
    my $output = $accent ~ "" ~ "$fg";
    my $playing = chomp QX "xdotool search --name 'Youtube' | tail -n1 | xargs xdotool getwindowname | sed 's/ - YouTube - Waterfox//' | sed 's/YouTube - Waterfox//'";
    return $output ~ $playing;
}

sub wifi() {
    my $output = $accent ~ "" ~ "$fg";
    my @wifi_bssid = chomp QX "/sbin/iwlist wlp4s0 scanning | grep Address | rev | cut -d : -f 1-2 | rev | head -n1".split: "\n";
    if @wifi_bssid.elems > 1 {
        say @wifi_bssid.elems;
        return;
    }
    my $bssid = @wifi_bssid[0];
    return "$output$bssid ";
}

sub volume() {
    my $volume = chomp QX "pamixer --get-volume";
    my $muted = chomp(QX "pamixer --get-mute") eq "true";
    return $accent ~ "{ $muted ?? "" !! "" }" ~ $fg ~ $volume ~ "% ";
}

sub window_title() {
    return $fg ~ chomp QX "xdotool getwindowfocus getwindowname";
}

sub clock() {
    my $output = $accent ~ "" ~ "$fg";
    my $now = DateTime.now(formatter => { sprintf "%04d-%02d-%02d %02d:%02d", .year, .month, .day, .hour, .minute }); 
    return $output ~ $now;
}

sub align($alignment) {
    return "%\{$alignment\}"
}

loop {
    #say " ", battery, nowplaying, align('c'), window_title, align('r'), wifi, volume, clock, " ";
    say " ", nowplaying, align('c'), window_title, align('r'), battery, wifi, volume, clock, " ";
    sleep 0.2;
}
