outFilename= "imPlotFuncs.nelua"
File.open(outFilename, "w") do |fp|
  fp.puts("require'cimgui'")
  fp.puts("require'cimplot'")
  inFilename = "aliens/imPlotFuncs.nim"
  sLine = ""
  File.foreach(inFilename) do |line|
    next if not line =~ /^proc/
    #---------------
    # Gen func name
    #---------------
    sLine = line.gsub(/proc /, "global function ")
    #----------
    # Gen args
    #----------
    sArgs = ""
    if sLine =~ /\*\((.+)\)\:/
      $1.split(/,/).each do | arg |
        sArgs += arg.split(/ =/)[0] +  ","
      end
    end
    sArgs = sArgs.chop.gsub(/ int,/," cint,").gsub(/ int$/," cint").gsub(/ ptr /, " *").gsub(/cdouble/,"float64").gsub(/`ref`/,"ref")
    #------------
    # Gen pragma
    #------------
    if sLine =~ /(global function .+)\*\((.+)\)(\:.+)/ then
      sLine = $1 + "(#{sArgs})"
      pragma = $3
      pragma = pragma.gsub(/{./,"<").gsub(/.}/,"> end").gsub(/ importc:/,"cimport").gsub(/cdecl/,"nodecl").gsub(/\"/,"'")
      sLine += pragma
    end
    fp.puts sLine
  end
end
