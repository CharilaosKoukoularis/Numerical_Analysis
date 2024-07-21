function x = PartitioningMethod(a,b,f,epsilon)

    d = (b - a)/2;
    if ((f(a + d) == 0) || (d <= epsilon)) 
        if d <= epsilon
            x = [a, b];
        else
            x = a + d;
        end
    else
        if sign(f(a + d)) == sign(f(a))
            a = a + d;
            x = PartitioningMethod(a,b,f,epsilon);
        else
            b = a + d;
            x = PartitioningMethod(a,b,f,epsilon);
        end
    end
end