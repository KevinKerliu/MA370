function shift = wilkinsonShift(B)

delta = ( B(1,1) - B(2,2) ) / 2;

if delta == 0
    sign_delta = 1;
else
    sign_delta = sign(delta);
end

shift =  B(2,2) - ( sign_delta*B(1,2)^2 ) / ( abs(delta) + sqrt(delta^2 + B(1,2)^2) );

end

