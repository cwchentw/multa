require 'multa'

# Validate that DATA.split doesn't exist
begin
    DATA.split
    
    raise "It should not exist"
rescue
    nil
end

# Validate that Data.cut doesn't exist
begin
    DATA.cut
    
    raise "It should not exist"
rescue
    nil
end