(*******************************************************************************

EC2 functions

*******************************************************************************)

Package["AWSLink`"]

PackageImport["JLink`"]
PackageImport["GeneralUtilities`"]

(*----------------------------------------------------------------------------*)
PackageExport["EC2ClientObject"]

(* This is a utility function defined in GeneralUtilities, which makes a nicely
formatted display box *)
DefineCustomBoxes[EC2ClientObject, 
	e:EC2ClientObject[id_] :> Block[{},
	BoxForm`ArrangeSummaryBox[
		EC2ClientObject, e, None, 
		{BoxForm`SummaryItem[{""}]},
		{},
		StandardForm
	]
]];

EC2ClientObject[id_]["JLink"] := id

(*----------------------------------------------------------------------------*)
PackageExport["EC2ClientCreate"]

SetUsage[EC2ClientCreate,
"EC2ClientCreate[] create to EC2 using the default credential provider chain."
]

EC2ClientCreate[] := Module[{obj},
	LoadJavaClass["com.amazonaws.services.ec2.AmazonEC2ClientBuilder"];
	obj = com`amazonaws`services`ec2`AmazonEC2ClientBuilder`defaultClient[];
	If[FailureQ[obj], Return[$Failed]];
	EC2ClientObject[obj]
]