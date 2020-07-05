for fps=4376:-1:100
    im=imread(['BA\',num2str(fps),'.jpg']);
    for n=0:1:19
        for m=0:15
            K=0;
            for p=1:67
                for q=1:67
                    K=K+sum(im(67*m+q,67*n+p));
                end
            end
            im_(m+1,n+1)=round((K/67+64)/255)*255;
        end
    end
    imwrite(im_,['BA_\',num2str(fps),'.jpg']);
    fprintf('n=%d\n',fps);
end
