configuration Foldercreation
    { 
 Node localhost
       
        {
          File CreateFile {
            Type = 'Directory'
            DestinationPath = 'C:\lalukumar'
            Ensure = "Present"
            }
        }
    }
