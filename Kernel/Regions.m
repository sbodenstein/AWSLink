(*******************************************************************************

Region functions

*******************************************************************************)

Package["AWSLink`"]

PackageImport["JLink`"]
PackageImport["GeneralUtilities`"]

(*----------------------------------------------------------------------------*)
PackageExport["AWSRegionNames"]

SetUsage[AWSRegionNames,
"AWSRegionNames[] returns a list of string names of all AWS regions."
]

AWSRegionNames[] := Module[{regionObjects},
	LoadJavaClass["com.amazonaws.regions.Regions"];
	regionObjects = com`amazonaws`regions`Regions`values[];
	(#@name[])& /@ regionObjects
]
