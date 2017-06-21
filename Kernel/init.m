Package["AWSLink`"]

Quiet @ Needs["GeneralUtilities`"];
Quiet @ Get["JLink`"];

JLink`AddToClassPath @ FileNameJoin[{ParentDirectory[DirectoryName @ $InputFileName], "Java"}];
