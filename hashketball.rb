def game_hash
    {home: 
      {team_name: "Brooklyn Nets",
       colors: ["Black", "White"],
       players:
       [{player_name: "Alan Anderson",
         number: 0,
         shoe: 16,
         points: 22,
         rebounds: 12,
         assists: 12,
         steals: 3,
         blocks: 1,
         slam_dunks: 1},
         
         {player_name: "Reggie Evans",
         number: 30,
         shoe: 14,
         points: 12,
         rebounds: 12,
         assists: 12,
         steals: 12,
         blocks: 12,
         slam_dunks: 7},
         
         {player_name: "Brook Lopez",
         number: 11,
         shoe: 17,
         points: 17,
         rebounds: 19,
         assists: 10,
         steals: 3,
         blocks: 1,
         slam_dunks: 15},
         
         {player_name: "Mason Plumlee",
         number: 1,
         shoe: 19,
         points: 26,
         rebounds: 11,
         assists: 6,
         steals: 3,
         blocks: 8,
         slam_dunks: 5},
         
         {player_name: "Jason Terry",
         number: 31,
         shoe: 15,
         points: 19,
         rebounds: 2,
         assists: 2,
         steals: 4,
         blocks: 11,
         slam_dunks: 1}]},
      
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [{player_name: "Jeff Adrien",
         number: 4,
         shoe: 18,
         points: 10,
         rebounds: 1,
         assists: 1,
         steals: 2,
         blocks: 7,
         slam_dunks: 2},
         
         {player_name: "Bismack Biyombo",
         number: 0,
         shoe: 16,
         points: 12,
         rebounds: 4,
         assists: 7,
         steals: 22,
         blocks: 15,
         slam_dunks: 10},
         
         {player_name: "DeSagna Diop",
         number: 2,
         shoe: 14,
         points: 24,
         rebounds: 12,
         assists: 12,
         steals: 4,
         blocks: 5,
         slam_dunks: 5},
         
         {player_name: "Ben Gordon",
         number: 8,
         shoe: 15,
         points: 33,
         rebounds: 3,
         assists: 2,
         steals: 1,
         blocks: 1,
         slam_dunks: 0},
         
         {player_name: "Kemba Walker",
         number: 33,
         shoe: 15,
         points: 6,
         rebounds: 12,
         assists: 12,
         steals: 7,
         blocks: 5,
         slam_dunks: 12}]
        }
    }
end

def num_points_scored(player)
  game_hash.each do |(side, info_hash)|
    info_hash[:players].each do |player_hash|
      if player_hash[:player_name] == player
        return player_hash[:points]
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |(side, info_hash)|
    info_hash[:players].each do |player_hash|
      if player_hash[:player_name] == player
        return player_hash[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |(side, info_hash)|
    if info_hash[:team_name] == team
      return info_hash[:colors]
    end
  end
end

def team_names
  game_hash.map {|(side, info_hash)| info_hash[:team_name]}
end

def player_numbers(team)
  game_hash.each do |(side, info_hash)|
    if info_hash[:team_name] == team
      return info_hash[:players].map {|player_hash| player_hash[:number]}
    end
  end
end
      
def player_stats(player)
  game_hash.each do |(side, info_hash)|
    info_hash[:players].each do |player_hash|
      if player_hash[:player_name] == player
        player_hash.shift
        return player_hash
      end
    end
  end
end

def big_shoe_rebounds #find player with largest shoe size and return their rebounds
  find_largest = game_hash.reduce({}) do |memo, (side, info_hash)|
    memo = info_hash[:players][0] if !memo[:shoe]
    largest_shoe_hash = info_hash[:players].max_by {|player_hash| player_hash[:shoe]}
    memo = largest_shoe_hash if largest_shoe_hash[:shoe] > memo[:shoe]
    memo
  end
  find_largest[:rebounds]
end

#bonus

def most_points_scored
  find_scorer = game_hash.reduce({}) do |memo, (side, info_hash)|
    memo = info_hash[:players][0] if !memo[:points]
    most_points_hash = info_hash[:players].max_by {|player_hash| player_hash[:points]}
    memo = most_points_hash if most_points_hash[:points] > memo[:points]
    memo
  end
  find_scorer[:player_name]
end
      
