Connect-SPOService -URL https://riveron-admin.sharepoint.com 
$outputfile = @()
$date = Get-Date -Format "M_dd_yyyy"
$date2 = Get-Date -Format "MM/dd/yyyy"
$path = "$env:Userprofile\Riveron Consulting\Riveron IT Collaboration - IT Management - IT Management\Sharepoint Usage Data\"+$date+".csv"
$sites=Get-SPOSite -Limit All | Select LastContentModifiedDate, Status, StorageUsageCurrent, URL, Title 
foreach ($site in $sites){
	$outputfile +=([pscustomobject]@{LastModifiedDate=$site.LastContentModifiedDate;Status=$site.Status;StorageAmountinMB=$site.StorageUsageCurrent;URL=$site.url;Title=$site.URL;ReportDate=$date2})
		}

$outputfile | export-csv -path $path -Encoding UTF8 -NoTypeInformation