require 'net/http'
require 'net/telnet'

class DDWRT
 @@uri = URI('http://192.168.1.1/Info.htm')
 @@secur =  URI('http://192.168.1.1/Status_Router.asp')
  def getInfo
    @max = Net::HTTP.get(@@secur)
    puts @max#[@max.index('wl_xmit'), 20]
  end

  def test
    localhost = Net::Telnet::new("Host" => "192.168.1.1",
                             "Timeout" => 10,
                             "Prompt" => /[$%#>] \z/)
    localhost.login("Name" => "root", "Password" => "test") #{ |c| print c }
    test = ""
    localhost.cmd("iwconfig ra0") { |c| test << c }
    puts test 
    #localhost.waitfor("ra0") { |c|  c }
    #File.open("x:/test.txt").each {|line| localhost.cmd line.chomp}
    #@fd = @test.index('ESSID')

  end
end
as = DDWRT.new
#as.getInfo()
as.test()

