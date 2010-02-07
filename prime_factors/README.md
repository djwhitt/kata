Prime Factors Kata
==================

Test 1
------

#### Tests

    class TestPrimeFactors < Test::Unit::TestCase
      def test_one
        assert_equal [], PrimeFactors.generate(1)
      end
    end

#### Implementation

    class PrimeFactors
      def self.generate(n)
        []
      end
    end

Test 2
------

### Step 1 ###

#### Tests

    class TestPrimeFactors < Test::Unit::TestCase
      def test_one
        assert_equal [], PrimeFactors.generate(1)
      end
    
      def test_two
        assert_equal [2], PrimeFactors.generate(2)
      end
    end

#### Implementation

    class PrimeFactors
      def self.generate(n)
        primes = []
    
        if n > 1
          primes << 2
        end
    
        primes
      end
    end

### Step 2 ###

#### Tests

    class TestPrimeFactors < Test::Unit::TestCase
      def setup
        @p = PrimeFactors
      end
   
      def test_one
        assert_equal [], @p.generate(1)
      end
    
      def test_two
        assert_equal [2], @p.generate(2)
      end
    end

#### Implementation

    class PrimeFactors
      def self.generate(n)
        primes = []
    
        if n > 1
          primes << 2
        end
    
        primes
      end
    end

Test 3
------

#### Tests

    class TestPrimeFactors < Test::Unit::TestCase
      def setup
        @p = PrimeFactors
      end
    
      def test_one
        assert_equal [], @p.generate(1)
      end
    
      def test_two
        assert_equal [2], @p.generate(2)
      end
    
      def test_three
        assert_equal [3], @p.generate(3)
      end
    end

#### Implementation

    class PrimeFactors
      def self.generate(n)
        primes = []
    
        if n > 1
          primes << n
        end
    
        primes
      end
    end

Test 4
------

#### Tests

    class TestPrimeFactors < Test::Unit::TestCase
      def setup
        @p = PrimeFactors
      end
    
      def test_one
        assert_equal [], @p.generate(1)
      end
    
      def test_two
        assert_equal [2], @p.generate(2)
      end
    
      def test_three
        assert_equal [3], @p.generate(3)
      end
    
      def test_four
        assert_equal [2, 2], @p.generate(4)
      end
    end

#### Implementation

    class PrimeFactors
      def self.generate(n)
        primes = []
    
        if n > 1
          if n % 2 == 0
            primes << 2
            n /= 2
          end

          primes << n if n > 1
        end
    
        primes
      end
    end

Test 5
------

#### Tests

    class TestPrimeFactors < Test::Unit::TestCase
      def setup
        @p = PrimeFactors
      end
    
      def test_one
        assert_equal [], @p.generate(1)
      end
    
      def test_two
        assert_equal [2], @p.generate(2)
      end
    
      def test_three
        assert_equal [3], @p.generate(3)
      end
    
      def test_four
        assert_equal [2, 2], @p.generate(4)
      end
    
      def test_six
        assert_equal [2, 3], @p.generate(6)
      end
    end

#### Implementation

    class PrimeFactors
      def self.generate(n)
        primes = []
    
        if n > 1
          if n % 2 == 0
            primes << 2
            n /= 2
          end

          primes << n if n > 1
        end
    
        primes
      end
    end

Test 6
------

#### Tests

    class TestPrimeFactors < Test::Unit::TestCase
      def setup
        @p = PrimeFactors
      end
    
      def test_one
        assert_equal [], @p.generate(1)
      end
    
      def test_two
        assert_equal [2], @p.generate(2)
      end
    
      def test_three
        assert_equal [3], @p.generate(3)
      end
    
      def test_four
        assert_equal [2, 2], @p.generate(4)
      end
    
      def test_six
        assert_equal [2, 3], @p.generate(6)
      end
    
      def test_eight
        assert_equal [2, 2, 2], @p.generate(8)
      end
    end

#### Implementation

    class PrimeFactors
      def self.generate(n)
        primes = []
    
        if n > 1
          while n % 2 == 0
            primes << 2
            n /= 2
          end

          primes << n if n > 1
        end
    
        primes
      end
    end

Test 7
------

#### Tests

    class TestPrimeFactors < Test::Unit::TestCase
      def setup
        @p = PrimeFactors
      end
    
      def test_one
        assert_equal [], @p.generate(1)
      end
    
      def test_two
        assert_equal [2], @p.generate(2)
      end
    
      def test_three
        assert_equal [3], @p.generate(3)
      end
    
      def test_four
        assert_equal [2, 2], @p.generate(4)
      end
    
      def test_six
        assert_equal [2, 3], @p.generate(6)
      end
    
      def test_eight
        assert_equal [2, 2, 2], @p.generate(8)
      end
    
      def test_nine
        assert_equal [3, 3], @p.generate(9)
      end
    end

#### Implementation

    class PrimeFactors
      def self.generate(n)
        primes = []
        candidate = 2
    
        while n > 1
          while n % candidate == 0
            primes << candidate
            n /= candidate
          end
    
          candidate += 1
        end
    
        primes
      end
    end
