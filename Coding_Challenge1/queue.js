export default class Queue {
  constructor(init_window) {
    this.queue = init_window.map(el => {
      return { value: el, subrange_sum: 0 };
    });
    this.current_sum = 0;
    this.total = 0;
  }

  dequeue() {
    // Dequeue
    let shifted = this.queue.shift;

    this.total -= shifted.subrange_sum
  }

  enqueue(ele) {
    // Enqueue
    this.queue.push({ value: ele, subrange_sum: current_sum })
  }

  window_sum() {
    // Calculates total of all subranges
  }

  subrange_sum() {
    // Calculates how many increasing or decreasing subranges that start
    // at the given queue element
  }

  update() {
    // Updates subrange sums once something is enqueued
  }
}

// module.exports = Queue;
