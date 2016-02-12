Configuration GetLabfiles
{
  param ($MachineName)

  Node $MachineName
  {
	Script ConfigureVM { 
		SetScript = { 
	    $dir = "c:\Labfiles"
            $FileURI = "https://raw.githubusercontent.com/KevinRemde/BuildARMLab/master/Labfiles.zip"
            New-Item $dir -ItemType directory
            $output = "$dir\Labfiles.zip"
            (New-Object System.Net.WebClient).DownloadFile($FileURI,$output)
        } 

		TestScript = { 
			Test-Path c:\Labfiles
		} 
		GetScript = { <# This must return a hash table #> }          }   
  }
} 