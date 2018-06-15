require 'stringio'

module Multa
  if defined? DATA then
    # Split DATA object into a hash of (title, string) pairs.
    def DATA.split(head='@@')
      out = Hash.new
      temp = ""
      title = ""

      self.each do |line|
        m = line.match(/^#{head}\s+(.*)/)
        if not m.nil? then
          title = m.captures[0].to_sym
          out[title] = ""
        else
          if out[title].nil? then
            temp << line
          else
            out[title] << line
          end
        end
      end
      
      if out.empty?
        return StringIO.new(temp)
      end

      out.each {|k, v| out[k] = StringIO.new(v) }
    end
  
    # Cut DATA object into an array of strings.
    def DATA.cut(head='@@')
      out = []
      temp = ""
      i = -1

      self.each do |line|
        m = line.match(/^#{head}/)

        if not m.nil? then
          out << ""
          i += 1
        else
          if i < 0 then
            temp << line
          else
            out[i] << line
          end
        end
      end
    
      if out.length <= 0 then
        return StringIO.new(temp)
      end
    
      out.map { |e| StringIO.new(e) }
    end
  end
end