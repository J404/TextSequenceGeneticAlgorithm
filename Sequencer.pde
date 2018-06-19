public class Sequencer {
  Brain brain;
  float fitness;
  
  public Sequencer() {
    brain = new Brain(target);
    brain.makeGuess();
  }
  
  public void showGuess() {
    fill(255);
    textSize(26);
    text(brain.guessPhrase, width / 2 - 200, height / 2);
  }
  
  public void calculateFitness() {
    float score = 0;
    fitness = 0;
    
    for (int i = 0; i < target.length(); i++) {
      if (brain.guessPhrase.charAt(i) == target.charAt(i)) {
        score += 1.0;
      }
    }
    
    fitness += score / target.length();
  }
  
  public Sequencer getBaby(Sequencer parentB) {
    Sequencer baby = new Sequencer();
    baby.brain = brain.crossover(parentB);
    return baby;
  }
}
