%function [out ind] = getBinarySeq(p,d,s)
function [out ind] = getBinarySeq(p,d,s)

out = [];
ind = [];

b = p-d;


N=length(s);

for i=1:size(b,1)


    idx = find(b(i,:)~=0);

    v = b(i,idx);


    if( length(idx) >= N )

        for j=1:(length(idx)-N+1)

            if( isequal(s,v(j:j+N-1)) )

                out = [out; idx(j:j+N-1)];
                ind = [ind; i];

            end

        end

    end


end
