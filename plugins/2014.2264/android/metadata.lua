-- Android
local metadata =
{
    plugin =
    {
        format = "jar",
        manifest = 
        {
            permissions = {},
            usesPermissions =
            {
                "android.permission.INTERNET",
            },
            usesFeatures = {},
			applicationChildElements = {}
        },
    },
    coronaManifest = {
        dependencies = {},
    },
}
 
return metadata