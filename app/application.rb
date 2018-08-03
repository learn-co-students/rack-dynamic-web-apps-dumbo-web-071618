class Application
  @@count = 0
  def call(env)
    resp = Rack::Response.new

    num_1 = Kernel.rand(1..20)
    num_2 = Kernel.rand(1..20)
    num_3 = Kernel.rand(1..20)

    if num_1 == num_2 && num_2 == num_3
      @@count += 1
      resp.write "Tries: #{@@count}\n"
      resp.write "|#{num_1}|::|#{num_2}|::|#{num_3}|\n"
      resp.write "You Win!"
    else 
      @@count += 1
      resp.write "Ties: #{@@count}\n"
      resp.write "|#{num_1}|::|#{num_2}|::|#{num_3}|\n"
      resp.write "You Lose!"
    end

    resp.finish
  end

end
