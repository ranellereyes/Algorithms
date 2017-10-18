export default class Queue {
  constructor(init_window) {
    this.queue = init_window.map(el => {
      return { value: el, subrange_sum: 0 };
    });
    this.current_sum = 0;
    this.total = 0;
    this.last_seen = null;
  }

  peek() {
    return this.last_seen;
  }

  dequeue() {
    // Dequeue
    let shifted = this.queue.shift;

    this.total -= shifted.subrange_sum
  }

  enqueue(ele) {
    // Enqueue
    update_current_sum(this.last_seen, ele.value);
    this.queue.push({ value: ele, subrange_sum: this.current_sum })
    this.total += this.current_sum
  }

  update_current_sum(prev, curr) {
    if (this.current_sum > 0 && curr > prev) {
      this.current_sum++
    } else if (this.current_sum < 0 && curr < prev) {
      this.current_sum--
    } else {
      this.current_sum = 0;
    }
  }
}

// module.exports = Queue;
