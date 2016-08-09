# Calculating Pokemon Hidden Power type by IVs
# Based on calculations at http://bulbapedia.bulbagarden.net/wiki/Hidden_Power_(move)/Calculation

# types
types <- c("Fighting", "Flying", "Poison", "Ground", "Rock", "Bug",
          "Ghost", "Steel", "Fire", "Water", "Grass", "Electric",
          "Psychic", "Ice", "Dragon", "Dark")

# calculate Hidden Power type
get_hp_type <- function(hp, atk, def, sp, spa, spd) {
  
  # calculate least significant bits
  a <- hp %% 2
  b <- atk %% 2
  c <- def %% 2
  d <- sp %% 2
  e <- spa %% 2
  f <- spd %% 2
  
  # calculate type integer based on formula
  type <- floor(((a + 2*b + 4*c + 8*d +
                   16*e + 32*f) 
                 * 15)
                 / 63)
  
  return(types[type+1])
}

# calculate second least significant bit for damage calc
second_least_sig_bit <- function(iv) {
  
  # if iv divided by 4 has a remainder of 2 or 3,
  # the second least significant bit is 1
  if(iv %% 4 == 2 | iv %% 4 == 3) {
    return(1)
  }
  else { # else, the second least significant bit is 0
    return(0)
  }
}

# calculate Hidden Power damage
get_hp_damage <- function(hp, atk, def, sp, spa, spd) {
  u <- second_least_sig_bit(hp)
  v <- second_least_sig_bit(atk)
  w <- second_least_sig_bit(def)
  x <- second_least_sig_bit(sp)
  y <- second_least_sig_bit(spa)
  z <- second_least_sig_bit(spd)
  
  dmg <- floor((((u + 2*v + 4*w + 8*x + 16*y + 32*z)
               * 40)
               / 63)
               + 30)
  
  return(dmg)
}
