function  JUNO_read_B(startdate,stopdate)

global epochBprel doyprel Bxprel Byprel Bzprel xprel yprel zprel;
global epochB doy Bx By Bz x y z;


%--- Initialize
path = '';

%--- Convert dates to datenum
startdatenum = datenum(startdate(1),startdate(2),startdate(3));
stopdatenum = datenum(stopdate(1),stopdate(2),stopdate(3));

% Initialize data
epochB = [];
Bx = [];
By = [];
Bz = [];
x = [];
y = [];
z = [];

epochB_ = {};
Bx_ = {};
By_ = {};
Bz_ = {};
x_ = {};
y_ = {};
z_ = {};

tempdoy = 0;
for datenumber = startdatenum:stopdatenum
    % Get day of year (doy)
    doy = day(datetime(datenumber,'ConvertFrom','datenum'),'dayofyear');
    
    % Handle new year
    if tempdoy > doy
        startdate(1) = startdate(1)+1;
    end
    
    % Construct filename
    doyformat = '%03d';
    dirres = dir([path 'fgm_jno_l3_' num2str(startdate(1)) num2str(doy,doyformat) 'ss_r1s_*.sts']);
    file = [dirres.folder '\' dirres.name];
    
    if contains(file, '.sts')
        %disp(['Reading file ' file]);
        fprintf('Reading B data from doy: %d\n', startdate(1)*1000+doy);
        
        % Read data from this doy
        JUNO_read_B_prel(file);
    else
        %disp(['Reading file ' file]);
        fprintf('Reading B data from doy: %d\t(no data found)\n', startdate(1)*1000+doy);
    end;
    
    % Append data
    
    epochB_{end+1} = epochBprel';
    Bx_{end+1} = Bxprel';
    By_{end+1} = Byprel';
    Bz_{end+1} = Bzprel';
    x_{end+1} = xprel';
    y_{end+1} = yprel';
    z_{end+1} = zprel';
    
    tempdoy = doy;
end;

fprintf('Concatinating B data\n');

epochB = cell2mat(epochB_);
Bx = cell2mat(Bx_);
By = cell2mat(By_);
Bz = cell2mat(Bz_);
x = cell2mat(x_);
y = cell2mat(y_);
z = cell2mat(z_);

return;