fp=fopen('name.c','wt');
fprintf(fp,['int data[',num2str(1024*LENGTH),']={']);

START=1;STEP=3;END=6564;
LENGTH=length(START:STEP:END);
K='';

for f=START:STEP:END
    im_=round(double(imread(['OLED_BA_128x64\',num2str(f),'.jpg']))/255);
    fprintf('%d\n',f);
    for m=0:7   %8行（8 pages）
        for n=0:127   %128列（128 Co）
            K=bin2dec( num2str( rot90( im_( 8*m+1:8*m+8,n+1 ) ,3) ) );
            fprintf(fp,[num2str(K),',']);%WARNING:the last ',' is unnecessary,it should be deleted by yourself!
        end
    end
end
fprintf(fp,'};');
fclose(fp);
