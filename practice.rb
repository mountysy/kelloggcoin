# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇

index = 0
user = []

loop do 
  if index == blockchain.size
    break
  end

    for transaction in blockchain
        from = blockchain[index]["from_user"]
        to = blockchain[index]["to_user"]
        user = user.push(from)
        user = user.push(to)
    end
  
  index = index + 1
end

uniq_user = user.uniq.compact  #.compact drops the nil value in array
puts "The users are:"
puts uniq_user
puts nil 

#how to generate the wallet hash automatically based on uniq_user array?
wallet = {
"ben" => {"name"=>"ben", "balance"=>0},
"brian" => {"name"=>"brian", "balance"=>0},
"evan" => {"name"=>"evan", "balance"=>0},
"anthony" => {"name"=>"anthony", "balance"=>0}
}

index = 0
loop do 
  if index == blockchain.size
    break
  end

    from = blockchain[index]["from_user"]
    to = blockchain[index]["to_user"]
    amount = blockchain[index]["amount"]

    if from == nil 
      wallet["#{to}"]["balance"] = wallet["#{to}"]["balance"] + amount
    elsif from != nil 
      wallet["#{from}"]["balance"] = wallet["#{from}"]["balance"] - amount
      wallet["#{to}"]["balance"] = wallet["#{to}"]["balance"] + amount
    end

  index = index + 1
end

for user in uniq_user
  puts "#{user}'s Kelloggcoin balance is #{wallet["#{user}"]["balance"]}."
end