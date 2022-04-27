function new_date = KEX_date_minute_offset(date, offset)

new_date = date;
new_date(5) = date(5)+offset;

if new_date(5)<0
    new_date(4) = new_date(4)-1;
    new_date(5) = new_date(5)+60;
    if new_date(4)<0
        new_date(3) = new_date(3)-1;
        new_date(4) = new_date(4)+24;
    end
else
    if new_date(5)>59
        new_date(4) = new_date(4)+1;
        new_date(5) = new_date(5)-60;
        if new_date(4)>23
            new_date(3) = new_date(3)+1;
            new_date(4) = new_date(4)-24;
        end
    end
end


return;