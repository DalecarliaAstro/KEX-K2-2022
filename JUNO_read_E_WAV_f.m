function E_WAV_f = JUNO_read_E_WAV_f(filename, dataLines)
%IMPORTFILE Import data from a text file
%  WAV2017003T000000EV02 = IMPORTFILE(FILENAME) reads data from text
%  file FILENAME for the default selection.  Returns the data as a
%  string array.
%
%  WAV2017003T000000EV02 = IMPORTFILE(FILE, DATALINES) reads data for
%  the specified row interval(s) of text file FILENAME. Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  WAV2017003T000000EV02 = importfile("C:\Users\tomask\OneDrive - KTH\Data\JUNO\WAV\WAV_2017003T000000_E_V02.CSV", [4, 4]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 16-Jan-2022 17:02:54

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [4, 4];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 154);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20", "Var21", "Var22", "Var23", "Var24", "Var25", "Var26", "Var27", "Var28", "LFR_LO_E_01", "LFR_LO_E_02", "LFR_LO_E_03", "LFR_LO_E_04", "LFR_LO_E_05", "LFR_LO_E_06", "LFR_LO_E_07", "LFR_LO_E_08", "LFR_LO_E_09", "LFR_LO_E_10", "LFR_LO_E_11", "LFR_LO_E_12", "LFR_LO_E_13", "LFR_LO_E_14", "LFR_LO_E_15", "LFR_LO_E_16", "LFR_LO_E_17", "LFR_LO_E_18", "LFR_LO_E_19", "LFR_LO_E_20", "LFR_LO_E_21", "LFR_LO_E_22", "LFR_LO_E_23", "LFR_LO_E_24", "LFR_LO_E_25", "LFR_LO_E_26", "LFR_LO_E_27", "LFR_LO_E_28", "LFR_LO_E_29", "LFR_LO_E_30", "LFR_LO_E_31", "LFR_LO_E_32", "LFR_LO_E_33", "LFR_LO_E_34", "LFR_LO_E_35", "LFR_LO_E_36", "LFR_LO_E_37", "LFR_LO_E_38", "LFR_LO_E_39", "LFR_LO_E_40", "LFR_LO_E_41", "LFR_LO_E_42", "LFR_LO_E_43", "Var72", "Var73", "Var74", "Var75", "Var76", "Var77", "Var78", "Var79", "Var80", "Var81", "Var82", "Var83", "Var84", "Var85", "Var86", "Var87", "Var88", "Var89", "Var90", "Var91", "Var92", "Var93", "Var94", "Var95", "Var96", "Var97", "Var98", "Var99", "Var100", "Var101", "Var102", "Var103", "Var104", "Var105", "Var106", "Var107", "Var108", "Var109", "Var110", "Var111", "Var112", "Var113", "Var114", "Var115", "Var116", "Var117", "Var118", "Var119", "Var120", "Var121", "Var122", "Var123", "Var124", "Var125", "Var126", "Var127", "Var128", "Var129", "Var130", "Var131", "Var132", "Var133", "Var134", "Var135", "Var136", "Var137", "Var138", "Var139", "Var140", "Var141", "Var142", "Var143", "Var144", "Var145", "Var146", "Var147", "Var148", "Var149", "Var150", "Var151", "Var152", "Var153", "Var154"];
opts.SelectedVariableNames = ["LFR_LO_E_01", "LFR_LO_E_02", "LFR_LO_E_03", "LFR_LO_E_04", "LFR_LO_E_05", "LFR_LO_E_06", "LFR_LO_E_07", "LFR_LO_E_08", "LFR_LO_E_09", "LFR_LO_E_10", "LFR_LO_E_11", "LFR_LO_E_12", "LFR_LO_E_13", "LFR_LO_E_14", "LFR_LO_E_15", "LFR_LO_E_16", "LFR_LO_E_17", "LFR_LO_E_18", "LFR_LO_E_19", "LFR_LO_E_20", "LFR_LO_E_21", "LFR_LO_E_22", "LFR_LO_E_23", "LFR_LO_E_24", "LFR_LO_E_25", "LFR_LO_E_26", "LFR_LO_E_27", "LFR_LO_E_28", "LFR_LO_E_29", "LFR_LO_E_30", "LFR_LO_E_31", "LFR_LO_E_32", "LFR_LO_E_33", "LFR_LO_E_34", "LFR_LO_E_35", "LFR_LO_E_36", "LFR_LO_E_37", "LFR_LO_E_38", "LFR_LO_E_39", "LFR_LO_E_40", "LFR_LO_E_41", "LFR_LO_E_42", "LFR_LO_E_43"];
opts.VariableTypes = ["string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20", "Var21", "Var22", "Var23", "Var24", "Var25", "Var26", "Var27", "Var28", "LFR_LO_E_01", "LFR_LO_E_02", "LFR_LO_E_03", "LFR_LO_E_04", "LFR_LO_E_05", "LFR_LO_E_06", "LFR_LO_E_07", "LFR_LO_E_08", "LFR_LO_E_09", "LFR_LO_E_10", "LFR_LO_E_11", "LFR_LO_E_12", "LFR_LO_E_13", "LFR_LO_E_14", "LFR_LO_E_15", "LFR_LO_E_16", "LFR_LO_E_17", "LFR_LO_E_18", "LFR_LO_E_19", "LFR_LO_E_20", "LFR_LO_E_21", "LFR_LO_E_22", "LFR_LO_E_23", "LFR_LO_E_24", "LFR_LO_E_25", "LFR_LO_E_26", "LFR_LO_E_27", "LFR_LO_E_28", "LFR_LO_E_29", "LFR_LO_E_30", "LFR_LO_E_31", "LFR_LO_E_32", "LFR_LO_E_33", "LFR_LO_E_34", "LFR_LO_E_35", "LFR_LO_E_36", "LFR_LO_E_37", "LFR_LO_E_38", "LFR_LO_E_39", "LFR_LO_E_40", "LFR_LO_E_41", "LFR_LO_E_42", "LFR_LO_E_43", "Var72", "Var73", "Var74", "Var75", "Var76", "Var77", "Var78", "Var79", "Var80", "Var81", "Var82", "Var83", "Var84", "Var85", "Var86", "Var87", "Var88", "Var89", "Var90", "Var91", "Var92", "Var93", "Var94", "Var95", "Var96", "Var97", "Var98", "Var99", "Var100", "Var101", "Var102", "Var103", "Var104", "Var105", "Var106", "Var107", "Var108", "Var109", "Var110", "Var111", "Var112", "Var113", "Var114", "Var115", "Var116", "Var117", "Var118", "Var119", "Var120", "Var121", "Var122", "Var123", "Var124", "Var125", "Var126", "Var127", "Var128", "Var129", "Var130", "Var131", "Var132", "Var133", "Var134", "Var135", "Var136", "Var137", "Var138", "Var139", "Var140", "Var141", "Var142", "Var143", "Var144", "Var145", "Var146", "Var147", "Var148", "Var149", "Var150", "Var151", "Var152", "Var153", "Var154"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20", "Var21", "Var22", "Var23", "Var24", "Var25", "Var26", "Var27", "Var28", "LFR_LO_E_01", "LFR_LO_E_02", "LFR_LO_E_03", "LFR_LO_E_04", "LFR_LO_E_05", "LFR_LO_E_06", "LFR_LO_E_07", "LFR_LO_E_08", "LFR_LO_E_09", "LFR_LO_E_10", "LFR_LO_E_11", "LFR_LO_E_12", "LFR_LO_E_13", "LFR_LO_E_14", "LFR_LO_E_15", "LFR_LO_E_16", "LFR_LO_E_17", "LFR_LO_E_18", "LFR_LO_E_19", "LFR_LO_E_20", "LFR_LO_E_21", "LFR_LO_E_22", "LFR_LO_E_23", "LFR_LO_E_24", "LFR_LO_E_25", "LFR_LO_E_26", "LFR_LO_E_27", "LFR_LO_E_28", "LFR_LO_E_29", "LFR_LO_E_30", "LFR_LO_E_31", "LFR_LO_E_32", "LFR_LO_E_33", "LFR_LO_E_34", "LFR_LO_E_35", "LFR_LO_E_36", "LFR_LO_E_37", "LFR_LO_E_38", "LFR_LO_E_39", "LFR_LO_E_40", "LFR_LO_E_41", "LFR_LO_E_42", "LFR_LO_E_43", "Var72", "Var73", "Var74", "Var75", "Var76", "Var77", "Var78", "Var79", "Var80", "Var81", "Var82", "Var83", "Var84", "Var85", "Var86", "Var87", "Var88", "Var89", "Var90", "Var91", "Var92", "Var93", "Var94", "Var95", "Var96", "Var97", "Var98", "Var99", "Var100", "Var101", "Var102", "Var103", "Var104", "Var105", "Var106", "Var107", "Var108", "Var109", "Var110", "Var111", "Var112", "Var113", "Var114", "Var115", "Var116", "Var117", "Var118", "Var119", "Var120", "Var121", "Var122", "Var123", "Var124", "Var125", "Var126", "Var127", "Var128", "Var129", "Var130", "Var131", "Var132", "Var133", "Var134", "Var135", "Var136", "Var137", "Var138", "Var139", "Var140", "Var141", "Var142", "Var143", "Var144", "Var145", "Var146", "Var147", "Var148", "Var149", "Var150", "Var151", "Var152", "Var153", "Var154"], "EmptyFieldRule", "auto");

% Import the data
E_WAV_f = readmatrix(filename, opts);

end