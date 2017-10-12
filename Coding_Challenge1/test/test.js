// var assert = require('assert');
import assert from 'assert';
import Queue from '../queue.js';

describe('Testing', function() {
  describe('Queue', function() {
    let test = new Queue([1, 2, 3]);
    it('should store an array once initialized', function() {
      assert(Array.isArray(test.queue));
    });

    it('every element should be a POJO with value and current subsum', function() {
      assert.deepEqual(test.queue.map(el => el.value), [1, 2, 3]);
      assert.deepEqual(test.queue.map(el => el.subrange_sum), [3, 2, 1]);
    });
  });

  describe('Initialization', function() {
    describe('should correctly calculate subsums for the following cases:', function() {
      it('all increasing', function() {
        assert.equal(true, false);
      });

      it('all decreasing', function() {
        assert.equal(true, false);
      });

      it('switches from increasing to decreasing', function() {
        assert.equal(true, false);
      });

      it('handles 0\'s at the trailing edge correctly', function() {
        assert.equal(true, false);
      });
    });
  });
});
