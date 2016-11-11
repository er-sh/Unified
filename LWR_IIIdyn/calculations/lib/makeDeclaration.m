% Create for an optimized maple c code output (in file 'fileName')
% the declarations ('decl') for the temporal variables
%
% Written by Kai Krieger
% on 18.8.2011


function decl = makeDeclaration(fileName)
    fh = fopen(fileName, 'r');

    %prepare the loop
    i = 1;
    line = fgets(fh);
    decl = '';
    decLine = '';
    lineCount = 0;
    expr = 't\d+ = ';
    
    % Do loop while there is input
    while (line ~= -1)
       % is there text
       if isstr(line)
           %           disp(sprintf('\t%i%s', i, line(1:length(line)-1)));

           %get Variable
           [v1 v2] = regexp(line, expr);
           %cut ' = '
           v2 = v2-3;
           if (~isempty(v1))
               %   disp(sprintf('\t\t%i -> %s\n', v1, line(v1:v2)));

               %always six variables in one line
               decLine = [decLine ', ' line(v1:v2)];
               if lineCount < 6
                   lineCount = lineCount + 1;
               else
                   lineCount = 0;
                   decl = [decl '   double' decLine(2:length(decLine)) sprintf(';\n')];
                   decLine = '';
               end
           end
       end
       
       %Line Number
       i = i+1;
       %get new Line
       line = fgets(fh);
       
    end
    decl = [decl '   double' decLine(2:length(decLine)) sprintf(';\n')];    
end
    