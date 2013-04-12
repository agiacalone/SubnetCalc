def ip_to_n(ip)
  n = 0
  ip.split('.').reverse.each_with_index do |byte,ii|
    n += byte.to_i * (256**ii)
  end
  n
end

def n_to_ip(n)
  s = ""
  s += (n / (256**3)).to_i.to_s
  n = n % 256**3
  s += '.' + (n / (256**2)).to_i.to_s
  n = n % 256**2
  s += '.' + (n / (256)).to_i.to_s
  n = n % 256
  s += '.' + n.to_s
  s
end

puts "Give me an IP:"
ip = gets
puts "Give me a netmask:"
nm = gets

ipn = ip_to_n(ip)
nmn = ip_to_n(nm)

puts "ip: #{ip}\t int(#{ipn})"
puts "nm: #{nm}\t int(#{nmn})"

cable = ipn & nmn
bcast = ipn | (~nmn & 2**32-1) # AND 0xFFFFFFFF to account for Fixnum size

puts "ip:    #{n_to_ip(ipn)}"
puts "nm:    #{n_to_ip(nmn)}"
puts "cable: #{n_to_ip(cable)} (#{cable}) aka subnet"
puts "bcast: #{n_to_ip(bcast)} (#{bcast})"
