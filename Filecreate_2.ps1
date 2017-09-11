configuration createFile
    {
    
    Node Localhost
       
        {
          File CreateFile {
            Type = 'Directory'
            DestinationPath = 'C:\Ratheesh'
            Ensure = "Present"
            }
        }
    }