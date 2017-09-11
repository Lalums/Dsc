configuration createFile
    {
Param (
[String[]]$computername
)
    
 Node @($Computername)
       
        {
          File CreateFile {
            Type = 'Directory'
            DestinationPath = 'C:\Ratheesh'
            Ensure = "Present"
            }
        }
    }