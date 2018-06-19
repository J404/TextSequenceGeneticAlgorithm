public class Population {
  Sequencer[] pop;
  float fitnessSum, minFit = 1000;
  int bestSeqInd = 0, gen = 1;
  
  public Population(int size) {
    pop = new Sequencer[size];
    
    for (int i = 0; i < pop.length; i++) {
      pop[i] = new Sequencer();
    }
  }
  
  public boolean hasFound() {
    selectBest();
    if (pop[bestSeqInd].brain.guessPhrase.equals(target)) {
      showBest();
      return true;
    } else
      return false;
  }
  
  public void naturalSelection() {
    Sequencer[] newGen = new Sequencer[pop.length];
    calculateFitnessSum();
    selectBest();
    
    newGen[0] = pop[bestSeqInd].getBaby(selectParent());
    
    for (int i = 0; i < newGen.length; i++) {
      Sequencer parentA = selectParent();
      Sequencer parentB = selectParent();
      newGen[i] = parentA.getBaby(parentB);
    }
    
    pop = newGen.clone();
    gen++;
  }
  
  public void calculateFitness() {
    for (Sequencer s : pop) {
      s.calculateFitness();
    }
  }
  
  public void calculateFitnessSum() {
    fitnessSum = 0;
    
    for (Sequencer s : pop) {
      fitnessSum += s.fitness;
    }
  }
  
  public Sequencer selectParent() {
    float running = 0.0;
    float rand = random(fitnessSum);
    
    for (Sequencer s : pop) {
      running += s.fitness;
      if (rand < running) {
        return s;
      }
    }
    
    return null;
  }
  
  public void mutate() {
    for (int i = 1; i < pop.length; i++) {
      pop[i].brain.mutate();
    }
  }
  
  public void selectBest() {
    float maxFit = 0.0;
    int maxI = 0;
    
    for (int i = 0; i < pop.length; i++) {
      if (pop[i].fitness > maxFit) {
        maxFit = pop[i].fitness;
        maxI = i;
      }
      if (pop[i].fitness < minFit) {
        pop[i].brain.mutate();
      }
    }
    bestSeqInd = maxI;
    minFit = pop[bestSeqInd].fitness;
  }
  
  public void showBest() {
    pop[bestSeqInd].showGuess();
  }
}
