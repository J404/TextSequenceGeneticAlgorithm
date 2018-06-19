String target;
Population pop;

void setup() {
  size(500, 500);
  target = "hello world!"; //phrase to find
  pop = new Population(1000);
}

void draw() {
  background(0);
  textSize(26);
  text("Best guess:", width / 2 - 200, height / 2 - 30);
  
  if (!pop.hasFound()) {
    pop.calculateFitness();
    pop.naturalSelection();
    pop.mutate();
    System.out.println(pop.gen);
  }
  pop.showBest();
}
