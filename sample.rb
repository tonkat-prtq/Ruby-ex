class Player
  def hand
    player_hands = ["グー", "チョキ", "パー"]
    puts "数字を入力してください。"
    puts "0: グー"
    puts "1: チョキ"
    puts "2: パー"

    n = gets.chomp #.chompを入力しないと、改行文字が含まれてしまうので下の行の処理がうまくいかない。
    until n == "0" || n == "1" || n == "2" do
      #n = gets.to_iとして、nの数値が2より大きい場合エラーを返す、と最初は実装したものの、文字列にto_iすると0を返すというRubyの仕様で、数値以外を入力してもじゃんけんができてしまっていた。このように、まず数字を文字列で取得し、その後数値化することで解決した。
      puts "不正な値です。"
      puts "数字を入力してください。"
      puts "0: グー"
      puts "1: チョキ"
      puts "2: パー"
      n = gets.chomp
    end

    player_hand = n.to_i #数値に変換
    puts player_hand
    puts "あなたの手は#{player_hands[player_hand]}"
    return player_hand
  end
end

class Enemy
  def hand
    enemy_hands = ["グー", "チョキ", "パー"]
    enemy_hand = rand(3) #最初はsampleでランダムかけていたが、それだと配列のインデックスを取り出せなかったので、こういう形に
    puts "相手の手は#{enemy_hands[enemy_hand]}"
    return enemy_hand
  end
end

class Janken
  def pon(player_hand, enemy_hand) #受け取る引数名を最初、player.hand, player.nameとしていたためエラーが出て進めなかった。
    if (player_hand - enemy_hand + 3) % 3 == 0 #あいこの場合whileで繰り返すようにしてたけど、あいこの後勝敗がついても何故かループしてしまっていた。if分岐とメソッド再呼び出しに変えたら解決。
      puts "あいこです、もう一度！"
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      janken.pon(player.hand, enemy.hand)
    elsif (player_hand - enemy_hand + 3) % 3 == 1
      puts "あなたの負けです。"
    else
      puts "あなたの勝ちです。"
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

janken.pon(player.hand, enemy.hand)
