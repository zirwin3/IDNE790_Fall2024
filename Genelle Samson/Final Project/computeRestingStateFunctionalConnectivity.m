function funcConnMap = computeRestingStateFunctionalConnectivity(V,seed)
    [h,w,d,T] = size(V);
    funcConnMap=zeros(h,w,d);
    mask = mean(V,4)~=0; 
    for p = 1:1:d
        for n = 1:1:w
            for m = 1:1:h            
                if mask(m,n,p) > 0
                    c = corrcoef(seed,V(m,n,p,:));
                    funcConnMap(m,n,p) = abs(c(1,2));
                end
            end
        end
    end
    funcConnMap = smooth3(funcConnMap,"gaussian",5,5);
    funcConnMap = funcConnMap/max(funcConnMap(:));
    funcConnMap = funcConnMap>0.5;
end