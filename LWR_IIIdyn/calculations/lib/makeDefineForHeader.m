% Adds an #ifndef #define #endif to an header fiel with fileName if
% id = 0 beginning
% id != 1 end
%
% Written by Kai Krieger
% on 11.1.2012

function [] = makeDefineForHeader(fileName, name, id)

    if (id == 0)
        fh = fopen(fileName, 'w');
        fseek(fh,0,'bof');
        fprintf(fh, ['#ifndef %s\n'...
                     '#define %s\n\n'], name, name);
    else
        fh = fopen(fileName, 'r+');
        fseek(fh,0,'eof');
        fprintf(fh, '\n#endif /* %s */\n', name);
    end
    
    fclose(fh);
    
end
