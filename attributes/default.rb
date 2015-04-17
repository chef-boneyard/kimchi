default['kimchi'].tap do |kimchi|
  kimchi['user']       = 'root'
  kimchi['group']      = 'root'
  kimchi['host']       = '0.0.0.0'
end
