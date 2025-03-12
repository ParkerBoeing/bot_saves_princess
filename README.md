# bot_saves_princess

## Table of Contents

- [How to Copy and Paste into HackerRank](#how-to-copy-and-paste-into-hackerrank)
- [Approach to Crafting Solutions](#approach-to-crafting-solutions)
- [How to Run on Local Machine](#how-to-run-on-local-machine)
  - [Downloading Software](#downloading-software)
  - [Running the Program](#running-the-program)
- [How to Build and Run in Docker](#how-to-build-and-run-in-docker)
- [About Me](#about-me)

## How to Copy and Paste into HackerRank

1. Navigate to the specific HackerRank problem page: [Challenge1](https://www.hackerrank.com/challenges/saveprincess) or [Challenge2](https://www.hackerrank.com/challenges/saveprincess2)
2. Copy the solution code from below
<details>
<summary>Challenge 1 bot saves princess </summary>

```ruby
def displayPathtoPrincess(n, grid)
  validateInteger(n)
  validateGrid(n, grid)

  center = n / 2
  corner = findPrincessCorner(grid)

  case corner
  when :top_left
    puts ("UP\nLEFT\n" * center)
  when :top_right
    puts ("UP\nRIGHT\n" * center)
  when :bottom_left
    puts ("DOWN\nLEFT\n" * center)
  when :bottom_right
    puts ("DOWN\nRIGHT\n" * center)
  else
    raise PrincessError, "Princess must be a 'p' in a corner of the grid."
  end
end

def findPrincessCorner(grid)
  return :top_left     if grid[0][0]   == 'p'
  return :top_right    if grid[0][-1]  == 'p'
  return :bottom_left  if grid[-1][0]  == 'p'
  return :bottom_right if grid[-1][-1] == 'p'
  nil
end

def validateGrid(n, grid)
  raise GridError, "grid is empty" if grid.empty?

  processed_grid = grid.map do |row|
    if row.is_a?(String)
      stripped = row.strip
      stripped.include?(" ") ? stripped.split : stripped
    else
      row
    end
  end

  if processed_grid.size != n || processed_grid.first.size != n
    raise GridError, "grid must have the same row and column count as given integer n"
  end
end

def validateInteger(n)
  raise IntegerValidationError, "n must be an odd integer" if n.even?
end

IntegerValidationError = Class.new(ArgumentError)
GridError        = Class.new(ArgumentError)
PrincessError    = Class.new(ArgumentError)

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
```
</details>

<details>
<summary>Challenge 2 bot saves princess 2 </summary>

```ruby
def nextMove(n, r, c, grid)
  validateGrid(n, grid)
  princessRow, princessCol = findPrincess(grid)

  if princessRow > r
    puts "DOWN"
  elsif princessRow < r
    puts "UP"
  elsif princessCol > c
    puts "RIGHT"
  elsif princessCol < c
    puts "LEFT"
  elsif princessRow == r && princessCol == c
    puts "You've found the princess!"
  end
end

def findPrincess(grid)
  grid.each_with_index do |row, i|
    col = row.index('p')
    return [i, col] if col
  end
  raise PrincessError, "Princess must be represented as the character p somewhere on the grid."
end

def validateGrid(n, grid)
  raise GridError, "grid is empty" if grid.empty?

  processed_grid = grid.map do |row|
    if row.is_a?(String)
      stripped = row.strip
      stripped.include?(" ") ? stripped.split : stripped
    else
      row
    end
  end

  if processed_grid.size != n || processed_grid.first.size != n
    raise GridError, "grid must have the same row and column count as given integer n"
  end
end

def validateInteger(n)
  raise IntegerValidationError, "n must be an odd integer" if n.even?
end

IntegerValidationError = Class.new(ArgumentError)
GridError        = Class.new(ArgumentError)
PrincessError    = Class.new(ArgumentError)

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)
```
</details>
<br>

3. Toggle preferred language to Ruby. Remove all pre-existing code then paste code from the corresponding code block into the provided editor window on HackerRank.
4. Click "Run Code" or "Submit Code" to test your solution.

## Approach to Crafting Solutions

- To solve each of the challenges I rewrote the problem in my own words to ensure I thoroughly understood what was being asked of me.
- I then broke the problem down into various steps and wrote an outline in pseudocode.
- After I crafted an initial solution, I reworked my logic to be as performant as possible using big O notation to calculate time complexity.
- Once I felt confident I had a viable and performant solution, even though this was only for a HackerRank code challenge, I reworked the logic with a mindset for production / enterprise level code. This included abstracting out methods for better readability and introducing error handling for a better debugging experience.
- I then tested and refined each of the solutions, ensuring robust and resilient code.

## How to Run on Local Machine

### Downloading Software

- Install latest ruby version (3.4.2 as of writing this on 3/12/25):
  - [Ruby](https://www.ruby-lang.org/en/documentation/installation/)

### Running the Program

1. Clone down the repo from git and cd into the main bot_saves_princess directory.
2. Run ``` bundle install ```
3. To run tests, execute ``` bundle exec rspec ``` in the terminal / CLI
3. Run the game file by navigating to the appropriate directory and executing the runner file:
    ```bash
    cd lib/game
    ruby runner.rb
    ```

## How to Build and Run in Docker

1. Download [Docker](https://www.docker.com/products/docker-desktop/) and start the Docker application

2. Build the Docker image:
    ```bash
    docker build -t bot_saves_princess .
    ```

3. Run the Docker container:
    ```bash
    docker run --rm -it bot_saves_princess
    ```

## About Me

- **Name:** Parker Boeing 
- **Occupation:** Software Developer / Engineer  
- **Links:** [LinkedIn](https://www.linkedin.com/in/parker-boeing/)
- **Contact:** [parker.boeing@gmail.com](mailto:parker.boeing@gmail.com)
