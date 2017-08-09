function [sim] = compare_similiarity(d1,d2)
    sim = dot(d1,d2)./(sqrt(sum(d1.^2))*sqrt(sum(d2.^2)));
    if(or(sum(d1.^2) == 0, sum(d2.^2) == 0))
        sim = 0;
    end
end