export default class Queue {
  constructor(init_window) {
    this.queue = init_window.map(el => {
      return { value: el, subrange_sum: 0 }; 
    });
  }

  dequeue() {
    // Dequeue
  }

  enqueue() {
    // Enqueue
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
