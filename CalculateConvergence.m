function l = CalculateConvergence()
    files = dir('c*.csv');
    ls = strings(1, length(files));
    for i = 1:numel(files)
        data = readmatrix(files(i).name);
        if size(data, 2) > 9
            varreal = data(:,8);
            varimag = data(:,9);
        else
            varreal = data(:,6);
            varimag = data(:,7);
        end
        realc = createFit(varreal);
        imagc = createFit(varimag);
        str = sprintf("%s, %f, %f\n", files(i).name, realc, imagc);
        ls(i) = str;
    end
    fileID = fopen('EstimatedConvergence.csv','w');
    fprintf(fileID, "Filename, Real Coefficient, Imag Coefficient\n");
    fprintf(fileID, "%s", ls);
    fclose(fileID);
    l = ls;
end

function coef = createFit(var)
% This tries to find a fit using multiple starting points until one is
% found
    for i = 1:128
        coef = createFitImpl(var);
        if coef > 0.0001
            return
        end
    end
end

function coef = createFitImpl(var)
    [xData, yData] = prepareCurveData( [], var );
    
    % Set up fittype and options.
    ft = fittype( 'a/(x^b)', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Lower = [-Inf 0];
    opts.Display = 'Off';
    opts.Robust = 'Bisquare';
    opts.StartPoint = [rand() rand()];
    
    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft, opts );
    coef = fitresult.b;
end