fp=fopen('python_4.txt','wt');
for f=1:4:4376
    im_=imread(['BA_\',num2str(f),'.jpg']);
    fprintf('%d\n',f);
    for m=0:1
        for n=0:3
            for q=1:8
                K=0;
                for p=1:5
                    K=K*2+im_(8*m+q,5*n+p)/255;
                end
                fprintf(fp,['LCD1602.makerobo_send_command(0x',dec2hex(64+(4*m+n)*8+q-1),')\n']);
                fprintf(fp,['LCD1602.makerobo_send_data(0x%s)\n'],dec2hex(K));
            end
        end
    end
    fprintf(fp,'n=n+1\nprint(n)\n');
end
fclose(fp);
