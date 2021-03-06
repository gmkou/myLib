property _msg : "radikoLib"


set RTMPDUMP to "/opt/local/bin/rtmpdump"
set FFMPEG to "/usr/local/bin/ffmpeg"

on myDump(in_rtmpdump, in_station, in_minutes, in_outputfilename)
	set fOutputFileName to in_outputfilename
	set fStation to in_station
	set fSeconds to in_minutes * 60
	
	do shell script "" & in_rtmpdump & " --rtmp \"rtmpe://radiko.smartstream.ne.jp/" & fSTA & "/_defInst_/simul-stream\" --live -B " & fSeconds & " --flv " & fOutputFileName & "  --port 1935 --swfUrl \"http://radiko.jp/player/player_0.0.9.swf\""
end myDump

on myEncode(in_ffmpeg, in_filename, in_outputfilename)
	do shell script "" & in_ffmpeg & " -y -i " & in_filename & " -vn " & in_outputfilename
end myEncode

on myRecord(in_program, in_station, in_munutes, in_outputfilepath, in_date)
	set fOutputFileName to "" & in_outputfilepath & in_program & "_" & in_date --without suffix
	set fFLV to "" & fOutputFileName & ".flv"
	set fMP3 to "" & fOutputFileName & ".mp3"
	
	myDump(RTMPDUMP, in_station, in_minutes, fFLV)
	myEncode(FFMPEG, fFLV, fMP3)
	
	do shell script "rm " & fFLV
end myRecord