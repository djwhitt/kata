Bowling Kata
============

Test 1
------

### Step 1 ###

#### Tests

    class TestGame < Test::Unit::TestCase
      def test_gutter_game
        g = Game.new
      end
    end

#### Implementation

    class Game
    end

### Step 2 ###

#### Tests

    class TestGame < Test::Unit::TestCase
      def test_gutter_game
        g = Game.new
        20.times do
          g.roll(0)
        end
      end
    end

#### Implementation

    class Game
      def roll(pins)
      end
    end

### Step 3 ###

#### Tests

    class TestGame < Test::Unit::TestCase
      def test_gutter_game
        g = Game.new
        20.times do
          g.roll(0)
        end
        assert_equal 0, g.score
      end
    end

#### Implementation

    class Game
      def roll(pins)
        0
      end
    
      def score
        0
      end
    end

Test 2
------

### Step 1 ###

#### Tests

    class TestGame < Test::Unit::TestCase
      def test_gutter_game
        g = Game.new
        20.times do
          g.roll 0
        end
        assert_equal 0, g.score
      end
    
      def test_all_ones
        g = Game.new
        20.times do
          g.roll 1
        end
        assert_equal 20, g.score
      end
    end

#### Implementation

    class Game
      def initialize
        @score = 0
      end
    
      def roll(pins)
        @score += pins
      end
    
      def score
        @score
      end
    end

### Step 2 ###

#### Tests

    class TestGame < Test::Unit::TestCase
      def setup
        @g = Game.new
      end
    
      def roll_many(n, pins)
        n.times do
          @g.roll pins
        end
      end
    
      def test_gutter_game
        roll_many 20, 0
        assert_equal 0, @g.score
      end
    
      def test_all_ones
        roll_many 20, 1
        assert_equal 20, @g.score
      end
    end

#### Implementation

    class Game
      def initialize
        @score = 0
      end
    
      def roll(pins)
        @score += pins
      end
    
      def score
        @score
      end
    end

Test 3
------

### Step 1 ###

#### Tests

    class TestGame < Test::Unit::TestCase
      def setup
        @g = Game.new
      end
    
      def roll_many(n, pins)
        n.times do
          @g.roll pins
        end
      end
    
      def test_gutter_game
        roll_many 20, 0
        assert_equal 0, @g.score
      end
    
      def test_all_ones
        roll_many 20, 1
        assert_equal 20, @g.score
      end
    
      def test_spare
        @g.roll 5
        @g.roll 5
        @g.roll 3
        roll_many 17, 0
        assert_equal 16, @g.score
      end
    end

#### Implementation

    class Game
      def initialize
        @rolls = []
      end
    
      def roll(pins)
        @rolls << pins
      end
    
      def score
        score = 0
        frame_index = 0

        10.times do
          if @rolls[frame_index] + @rolls[frame_index+1] == 10
            score += 10 + @rolls[frame_index+2]
            frame_index += 2
          else
            score += @rolls[frame_index] + @rolls[frame_index+1]
            frame_index += 2
          end
        end
    
        score
      end
    end

### Step 2 ###

#### Tests

    class TestGame < Test::Unit::TestCase
      def setup
        @g = Game.new
      end
    
      def roll_many(n, pins)
        n.times do
          @g.roll pins
        end
      end
    
      def roll_spare
        @g.roll 5
        @g.roll 5
      end
    
      def test_gutter_game
        roll_many 20, 0
        assert_equal 0, @g.score
      end
    
      def test_all_ones
        roll_many 20, 1
        assert_equal 20, @g.score
      end
    
      def test_spare
        roll_spare
        @g.roll 3
        roll_many 17, 0
        assert_equal 16, @g.score
      end
    end

#### Implementation

    class Game
      def initialize
        @rolls = []
      end
    
      def roll(pins)
        @rolls << pins
      end
    
      def score
        score = 0
        frame_index = 0

        10.times do
          if spare?(frame_index)
            score += 10 + @rolls[frame_index+2]
            frame_index += 2
          else
            score += @rolls[frame_index] + @rolls[frame_index+1]
            frame_index += 2
          end
        end
    
        score
      end
    
      protected
    
      def spare?(frame_index)
        @rolls[frame_index] + @rolls[frame_index+1] == 10
      end
    end

Test 4
------

### Step 1 ###

#### Tests

    class TestGame < Test::Unit::TestCase
      def setup
        @g = Game.new
      end
    
      def roll_many(n, pins)
        n.times do
          @g.roll pins
        end
      end
    
      def roll_spare
        @g.roll 5
        @g.roll 5
      end
    
      def roll_strike
        @g.roll 10
      end
    
      def test_gutter_game
        roll_many 20, 0
        assert_equal 0, @g.score
      end
    
      def test_all_ones
        roll_many 20, 1
        assert_equal 20, @g.score
      end
    
      def test_spare
        roll_spare
        @g.roll 3
        roll_many 17, 0
        assert_equal 16, @g.score
      end
    
      def test_strike
        roll_strike
        @g.roll 3
        @g.roll 4
        roll_many 16, 0
        assert_equal 24, @g.score
      end
    end

#### Implementation

    class Game
      def initialize
        @rolls = []
      end
    
      def roll(pins)
        @rolls << pins
      end
    
      def score
        score = 0
        frame_index = 0
    
        10.times do
          if strike?(frame_index)
            score += 10 + @rolls[frame_index+1] + @rolls[frame_index+2]
            frame_index += 1
          elsif spare?(frame_index)
            score += 10 + @rolls[frame_index+2]
            frame_index += 2
          else
            score += @rolls[frame_index] + @rolls[frame_index+1]
            frame_index += 2
          end
        end
    
        score
      end
    
      protected
    
      def spare?(frame_index)
        @rolls[frame_index] + @rolls[frame_index+1] == 10
      end
    
      def strike?(frame_index)
        @rolls[frame_index] == 10
      end
    end

### Step 2 ###

#### Tests

    class TestGame < Test::Unit::TestCase
      def setup
        @g = Game.new
      end
    
      def roll_many(n, pins)
        n.times do
          @g.roll pins
        end
      end
    
      def roll_spare
        @g.roll 5
        @g.roll 5
      end
    
      def roll_strike
        @g.roll 10
      end
    
      def test_gutter_game
        roll_many 20, 0
        assert_equal 0, @g.score
      end
    
      def test_all_ones
        roll_many 20, 1
        assert_equal 20, @g.score
      end
    
      def test_spare
        roll_spare
        @g.roll 3
        roll_many 17, 0
        assert_equal 16, @g.score
      end
    
      def test_strike
        roll_strike
        @g.roll 3
        @g.roll 4
        roll_many 16, 0
        assert_equal 24, @g.score
      end
    end

#### Implementation

    class Game
      def initialize
        @rolls = []
      end
    
      def roll(pins)
        @rolls << pins
      end
    
      def score
        score = 0
        frame_index = 0
    
        10.times do
          if strike?(frame_index)
            score += 10 + strike_bonus(frame_index)
            frame_index += 1
          elsif spare?(frame_index)
            score += 10 + spare_bonus(frame_index)
            frame_index += 2
          else
            score += sum_of_balls_in_frame(frame_index)
            frame_index += 2
          end
        end
    
        score
      end
    
      protected
    
      def sum_of_balls_in_frame(frame_index)
        @rolls[frame_index] + @rolls[frame_index+1]
      end
    
      def spare_bonus(frame_index)
        @rolls[frame_index+2]
      end
    
      def strike_bonus(frame_index)
        @rolls[frame_index+1] + @rolls[frame_index+2]
      end
    
      def spare?(frame_index)
        @rolls[frame_index] + @rolls[frame_index+1] == 10
      end
    
      def strike?(frame_index)
        @rolls[frame_index] == 10
      end
    end

Test 5
------

### Test 1 ###

#### Tests

    class TestGame < Test::Unit::TestCase
      def setup
        @g = Game.new
      end
    
      def roll_many(n, pins)
        n.times do
          @g.roll pins
        end
      end
    
      def roll_spare
        @g.roll 5
        @g.roll 5
      end
    
      def roll_strike
        @g.roll 10
      end
    
      def test_gutter_game
        roll_many 20, 0
        assert_equal 0, @g.score
      end
    
      def test_all_ones
        roll_many 20, 1
        assert_equal 20, @g.score
      end
    
      def test_spare
        roll_spare
        @g.roll 3
        roll_many 17, 0
        assert_equal 16, @g.score
      end
    
      def test_perfect_game
        roll_many(12, 10)
        assert_equal 300, @g.score
      end
    
      def test_strike
        roll_strike
        @g.roll 3
        @g.roll 4
        roll_many 16, 0
        assert_equal 24, @g.score
      end
    end

#### Implementation

    class Game
      def initialize
        @rolls = []
      end
    
      def roll(pins)
        @rolls << pins
      end
    
      def score
        score = 0
        frame_index = 0
    
        10.times do
          if strike?(frame_index)
            score += 10 + strike_bonus(frame_index)
            frame_index += 1
          elsif spare?(frame_index)
            score += 10 + spare_bonus(frame_index)
            frame_index += 2
          else
            score += sum_of_balls_in_frame(frame_index)
            frame_index += 2
          end
        end
    
        score
      end
    
      protected
    
      def sum_of_balls_in_frame(frame_index)
        @rolls[frame_index] + @rolls[frame_index+1]
      end
    
      def spare_bonus(frame_index)
        @rolls[frame_index+2]
      end
    
      def strike_bonus(frame_index)
        @rolls[frame_index+1] + @rolls[frame_index+2]
      end
    
      def spare?(frame_index)
        @rolls[frame_index] + @rolls[frame_index+1] == 10
      end
    
      def strike?(frame_index)
        @rolls[frame_index] == 10
      end
    end
