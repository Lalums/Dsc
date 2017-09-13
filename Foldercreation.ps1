configuration Foldercreation
    { 
 Node localhost
       
        {
          File CreateFile {
            Type = 'Directory'
            DestinationPath = 'C:\lalu'
            Ensure = "Present"
            }
        }
    }