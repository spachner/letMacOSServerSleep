#!/usr/bin/env ruby
require 'colorize'  # gem install colorize

puts "Hello from checkAndSleep"

$debug = false

def eyeTVRec
    `osascript eyeTV_Is_CurrentlyRecording.scpt`.chomp == 'true'
end

def eyeTVExp
    `osascript eyeTV_Is_CurrentlyExporting.scpt`.chomp == 'true'
end

def eyeTVCom
    `osascript eyeTV_Is_CurrentlyCompacting.scpt`.chomp == 'true'
end

def eyeTVPly
    `osascript eyeTV_Is_CurrentlyPlaying.scpt`.chomp == 'true'
end

def spotifyPly
    `osascript spotify_is_playing.scpt`.chomp == 'true'
end

def tmBacking
    `tmutil status|grep -c "Running = 1"`.chomp == '1'
end

def sleepMac
    `pmset sleepnow` unless $debug
    puts "skip sleeping for debugging" if $debug
end

def checkDisplayOn
    #["AppleBacklightDisplay", "3", "3", "USEABLE"]     when Display on
    #["AppleBacklightDisplay", "3", "3", "None"]        when Display off
    state = `pmset -g powerstate|grep AppleBacklightDisplay`.split[3]
    print ">#{state}<\n" if $debug
    state == 'USEABLE'
end

class StrColor1
    attr_reader :val
    def initialize(s, v)
        @str0 = s
        @val = v
    end

    def to_s
        if @val
            @str0.green
        else
            @str0.red
        end
    end
end

class StrColor2 < StrColor1
    def initialize(s0, s1, v)
        super(s0, v)
        @str1 = s1
    end

    def to_s
        if @val
            @str1.green
        else
            @str0.red
        end
    end
end

def checkAndSleep
    rec      = StrColor1.new('rec',   eyeTVRec)
    export   = StrColor1.new('exp',   eyeTVExp)
    compress = StrColor1.new('com',   eyeTVCom)
    play     = StrColor1.new('ply',   eyeTVPly)
    spPlay   = StrColor1.new('spotify', spotifyPly)
    tm       = StrColor1.new('timemachine', tmBacking)
    dspOn    = StrColor1.new('dispOn', checkDisplayOn)
    doSleep  = StrColor2.new('no sleeping', 'enter sleep',
        !(rec.val || export.val || compress.val || play.val || spPlay.val || tm.val) && !dspOn.val)
    puts "#{Time.new}: EyeTV (#{rec}, #{export}, #{compress}, #{play}), #{spPlay}, #{tm}, #{dspOn} => #{doSleep}"
    if doSleep.val
        puts "\tgoto sleep" if $debug
        sleepMac
    else
        puts "\tkeep awake" if $debug
    end
end

if __FILE__ == $0
    begin
        loop do
            #sleep (7*60)
            checkAndSleep
            #sleep (8*60)
            #sleep (1*60)
        end
    rescue Interrupt
        puts "Stopped by CTRL-C"
        exit
    end
end
