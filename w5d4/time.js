class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    let t = new Date();
    this.start = {
      hours: t.getHours(),
      mins: t.getMinutes(),
      secs: t.getSeconds()
    };
    this.printTime();
    // setInterval( this._tick.bind(this), 1000);
    setInterval( () => { this._tick(); }, 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.start.hours}:${this.start.mins}:${this.start.secs}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.start.secs += 1;
    let minAdder = Math.floor(this.start.secs / 60);
    this.start.secs = this.start.secs % 60;
    this.start.mins += minAdder;
    this.start.mins = this.start.mins % 60;
    let hourAdder = Math.floor(this.start.mins / 60);
    this.start.hours += hourAdder;
    this.printTime();
  }
}

const clock = new Clock();
