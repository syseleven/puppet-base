Facter.add('resolve_alpha_syseleven_de') do
  setcode do
    require 'socket'
    begin
    IPSocket::getaddress('alpha.syseleven.de') 
    rescue
      ''
    end
  end
end

Facter.add('resolve_prealpha_syseleven_de') do
  setcode do
    require 'socket'
    begin
    IPSocket::getaddress('prealpha.syseleven.de') 
    rescue
      ''
    end
  end
end
